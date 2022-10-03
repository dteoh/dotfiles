vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

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
require("nvim-tree").setup({
  respect_buf_cwd = true,
  view = {
    mappings = {
      custom_only = true,
      list = {
        { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
        { key = "v", action = "vsplit" },
        { key = "s", action = "split" },
        { key = "t", action = "tabnew" },
        { key = "r", action = "refresh" },
      },
    },
  },
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

vim.keymap.set('n', '<leader>t', '<cmd>NvimTreeToggle<cr>')
