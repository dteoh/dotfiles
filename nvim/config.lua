vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

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