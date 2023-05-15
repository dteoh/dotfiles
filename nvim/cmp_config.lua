local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<S-TAB>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, {'i'}),
    ['<TAB>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        return cmp.select_next_item()
      end

      local cursorCol = vim.fn.col('.')
      if cursorCol <= 1 then
        return fallback()
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
        return fallback()
      end
      if string.match(char, '%s') ~= nil then
        return fallback()
      end

      cmp.complete()
    end, {'i'}),
    ['<ESC>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({ select = true })
      else
        fallback()
      end
    end, {'i'}), 
  }),
  sources = {
    { name = 'fuzzy_buffer' }
  }
})
