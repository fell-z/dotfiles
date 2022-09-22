local vim = vim

vim.g.default_theme = "tokyonight"

-- change theme color styling depending of the time
local actual_time = tonumber(os.date("%H"))
if actual_time > 6 and actual_time < 18 then
  vim.g.tokyonight_style = "storm"
elseif actual_time > 18 or actual_time > 0 then
  vim.g.tokyonight_style = "night"
end

vim.cmd(string.format("colorscheme %s", vim.g.default_theme))

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
