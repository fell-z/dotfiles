local vim = vim

vim.cmd("colorscheme tokyonight-storm")

--[[
require("neo-tree").setup {
  window = {
    width = 26,
    position = "float",
  },
}
]]--

require("lualine").setup {
  options = {
    theme = "tokyonight",
    disabled_filetypes = { "neo-tree" },
    section_separators = { left = "", right = "" },
    component_separators = "|"
  },
  sections = {
    lualine_x = {
      { "fileformat", icons_enabled = false },
      { "filetype", colored = false },
    },
    lualine_y = {},
  },
  tabline = {
    lualine_a = { { "buffers", mode = 2 } },
    lualine_z = { "tabs" },
  },
  extensions = {
    "neo-tree",
    "aerial",
    "man"
  }
}
