vim.env.FZF_DEFAULT_COMMAND = 'rg --files --color=never --smart-case'
vim.g['rg_command'] = 'rg --vimgrep -S'

-- Find word under cursor
vim.keymap.set('n', '<Space>f', '<cmd>Rg<Space><cword>')

-- Emulate Ctrl-P
vim.keymap.set('n', '<C-P>', '<cmd>ProjectRootExe FZF<CR>')
