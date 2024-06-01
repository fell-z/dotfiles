local vim = vim
local os = require("os")

local time = tonumber(os.date("%H"))
if time < 16 and time > 6 then
  vim.cmd("colorscheme catppuccin-latte")
else
  vim.cmd("colorscheme tokyonight-storm")
end

require("lualine").setup {
  options = {
    disabled_filetypes = { "neo-tree" },
    section_separators = { left = "", right = "" },
    component_separators = "|"
  },
  sections = {
    lualine_x = {
      { "filetype", colored = true },
    },
    lualine_y = {
      { "fileformat", icons_enabled = false },
      { "filesize" }
    },
  },
  tabline = {
    lualine_a = { { "buffers", mode = 2 } },
    lualine_x = { "aerial" },
  },
  extensions = {
    "aerial",
    "man",
    "trouble"
  }
}
