local cmp = require('cmp')
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
  snippet = {
    expand = function(args)
    end,
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
      if not fallback then 
        vim.cmd('stopinsert')
      end
      fallback()
    end, {'i'}),
    ['<CR>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({ select = true })
      else
        fallback()
      end
    end, {'i'}),
  },
  sources = {
    { name = 'fuzzy_buffer' }
  }
})
