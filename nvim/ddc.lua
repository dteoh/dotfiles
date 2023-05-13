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
  isVisible = function()
    return vim.fn.pumvisible() ~= 0
  end,
}

DDC.custom.patch_global('ui', 'native')
DDC.custom.patch_global('sources', {'around', 'buffer', 'treesitter'})
DDC.custom.patch_global( 'sourceOptions', {
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
  if DDC.isVisible() then
    return '<Down>'
  else
    vim.call('ddc#map#manual_complete')
  end
end, { expr = true })

vim.keymap.set('i', '<S-TAB>', function ()
  if DDC.isVisible() then
    return '<Up>'
  else
    return '<C-h>'
  end
end, { expr = true })

vim.keymap.set('i', '<ESC>', function ()
  if DDC.isVisible() then
    return '<C-e>'
  else
    return '<ESC>'
  end
end, { expr = true })

vim.opt.pumheight = 7
vim.opt.pumwidth = 30

DDC.enable()
