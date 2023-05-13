local DDC = {
  custom = {
    patch_global = function(...)
      local args = {...}
      vim.call('ddc#custom#patch_global', unpack(args))
    end
  },
  enable = function()
    vim.call('ddc#enable')
  end,
  is_visible = function()
    return vim.fn.pumvisible() ~= 0
  end,
  map = {
    manual_complete = function()
      vim.call('ddc#map#manual_complete')
    end,
  },
}

DDC.custom.patch_global('ui', 'native')
DDC.custom.patch_global('sources', {'around', 'buffer', 'treesitter'})
DDC.custom.patch_global('sourceOptions', {
  around = { mark = '[A]' },
  buffer = { mark = '[B]' },
  treesitter = { mark = '[T]' },
  _ = {
    matchers = {'matcher_fuzzy'},
    sorters = {'sorter_fuzzy'},
    converters = {'converter_fuzzy'},
    ignoreCase = true,
    minAutoCompleteLength = 1,
    timeout = 500,
  },
})
DDC.custom.patch_global('sourceParams', {
  around = { maxSize = 10 },
  buffer = {
    bufNameStyle = 'basename',
  },
})

vim.keymap.set('i', '<TAB>', function ()
  local cursorCol = vim.fn.col('.')
  if cursorCol <= 1 then
    return '<TAB>'
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
    return '<TAB>'
  end
  if string.match(char, '%s') ~= nil then
    return '<TAB>'
  end

  if DDC.is_visible() then
    return '<Down>'
  else
    DDC.map.manual_complete()
  end
end, { expr = true })

vim.keymap.set('i', '<S-TAB>', function ()
  if DDC.is_visible() then
    return '<Up>'
  else
    return '<C-h>'
  end
end, { expr = true })

vim.keymap.set('i', '<ESC>', function ()
  if DDC.is_visible() then
    return '<C-e>'
  else
    return '<ESC>'
  end
end, { expr = true })

vim.opt.pumheight = 7
vim.opt.pumwidth = 30

DDC.enable()
