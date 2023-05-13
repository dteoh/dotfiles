vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- Disable arrow keys
local arrowKeys = {'<up>' ,'<down>', '<left>', '<right>'}
for i = 1, #arrowKeys do
  vim.keymap.set({'i', 'n'}, arrowKeys[i], '<nop>')
end

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', ';', ':')

vim.keymap.set({'i', 'n', 'v'}, '<F1>', '<ESC>')

-- Easier copying to system clipboard
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y')

-- Removes trailing whitespace
vim.keymap.set('n', '<leader>W', function ()
  local num_lines = vim.api.nvim_buf_line_count(0)
  if num_lines == 0 then
    return
  end

  for i = 0, num_lines do
    if i == num_lines then
      return
    end

    local line = vim.api.nvim_buf_get_lines(0, i, i + 1, true)
    local s, e = string.find(line[1], '%s+$')
    if s then
      vim.api.nvim_buf_set_text(0, i, s - 1, i, e, {})
    end
  end
end)

require('Comment').setup()

-- indent-blankline setup

vim.opt.list = true
vim.opt.listchars:append "tab:▸ "
vim.opt.listchars:append "trail:⋅"

require('indent_blankline').setup({
  char = '¦',
  show_end_of_line = false,
  show_first_indent_level = false,
})

-- nvim-tree configuration
local function nvim_tree_on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', 's', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', 't', api.node.open.tab, opts('Open: New Tab'))
  vim.keymap.set('n', 'r', api.tree.reload, opts('Refresh'))
end

require("nvim-tree").setup({
  on_attach = nvim_tree_on_attach,
  respect_buf_cwd = true,
  renderer = {
    highlight_opened_files = "all",
    special_files = {},
    full_name = true,
    icons = {
      webdev_colors = false,
      git_placement = "after",
      symlink_arrow = "@ ",
      glyphs = {
        default = "●",
        symlink = "↷",
        bookmark = "⁕",
        folder = {
          arrow_closed = "▶",
          arrow_open = "▼",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "->",
          symlink_open = "-o",
        },
      },
    },
  },
})

vim.keymap.set('n', '<leader>t', function()
  local api = require('nvim-tree.api')
  api.tree.toggle()
end)
