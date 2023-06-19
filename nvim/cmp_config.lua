local cmp = require('cmp')
local compare = require('cmp.config.compare')
local types = require('cmp.types')

local function canShowCompletionAtCursor()
  local cursorCol = vim.fn.col('.')
  if cursorCol <= 1 then
    return false
  end

  local cursorRow = vim.fn.line('.')
  local textBeforeCursor = vim.api.nvim_buf_get_text(
    0,
    cursorRow - 1,
    cursorCol - 2,
    cursorRow - 1,
    cursorCol - 1,
    {})

  local charExists, char = next(textBeforeCursor)
  if charExists == nil then
    return false
  end
  if string.match(char, '%s') ~= nil then
    return false
  end

  return true
end

cmp.setup({
  completion = {
    keyword_pattern = [[\k\+]],
  },
  confirmation = {
    get_commit_characters = function(_)
      return {'(', '.', '\'', '"', ':', '/', '-'}
    end
  },
  mapping = {
    ['<S-TAB>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item({ behavior = types.cmp.SelectBehavior.Select })
      else
        fallback()
      end
    end, {'i'}),
    ['<TAB>'] = cmp.mapping(function(fallback)
      if not canShowCompletionAtCursor() then
        return fallback()
      end

      if cmp.visible() then
        return cmp.select_next_item({ behavior = types.cmp.SelectBehavior.Select })
      end

      cmp.complete()
    end, {'i'}),
    ['<ESC>'] = cmp.mapping(function(fallback)
      if cmp.abort() then
        return
      end
      fallback()
      vim.cmd('stopinsert')
    end, {'i'}),
    ['<CR>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({ select = true })
      else
        fallback()
      end
    end, {'i'}),
  },
  preselect = cmp.PreselectMode.None,
  sorting = {
    priority_weight = 2,
    comparators = {
      require('cmp_fuzzy_buffer.compare'),
      compare.offset,
      compare.exact,
      compare.score,
      compare.recently_used,
      compare.kind,
      compare.sort_text,
      compare.length,
      compare.order,
    },
  },
  sources = {
    {
      name = 'buffer',
      keyword_length = 2,
      max_item_count = 5,
      priority = 30,
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end,
        max_indexed_line_length = 1024 * 5,
      },
    },
    { 
      name = 'fuzzy_buffer',
      keyword_length = 2,
      max_item_count = 5,
      priority = 20,
    },
    { 
      name = 'treesitter' ,
      keyword_length = 2,
      max_item_count = 5,
      priority = 10,
    },
  },
  snippet = {
    expand = function(args)
    end,
  },
})
