local vim = vim
local os = require("os")

local time = tonumber(os.date("%H"))
if time < 16 and time > 6 then
  vim.cmd("colorscheme catppuccin-latte")
else
  vim.cmd("colorscheme tokyonight-storm")
end

require("nvim-highlight-colors").setup {}

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
