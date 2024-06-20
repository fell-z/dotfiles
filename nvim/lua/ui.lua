vim.cmd([[colorscheme tokyonight-storm]])

local themes = {
  "catppuccin-latte",
  "catppuccin-macchiato",
  "tokyonight-storm",
  "tokyonight-day",
  "everforest",
  "kanagawa-wave",
  "kanagawa-dragon",
  "gruvbox",
  "patana"
}

local switchTheme = function()
  vim.ui.select(themes, { prompt = "Select theme to switch" }, function(choice)
    if choice ~= nil then
      vim.cmd([[colorscheme ]] .. choice)
    end
  end)
end

require("which-key").register({
  ["st"] = { switchTheme, "Switch theme" },
}, { prefix = "<leader>", mode = "n" })

require("lualine").setup {
  options = {
    disabled_filetypes = { "neo-tree" },
    section_separators = { left = "", right = "" },
    component_separators = "|",
  },
  sections = {
    lualine_x = {
      { "filetype", colored = true },
    },
    lualine_y = {
      { "fileformat", icons_enabled = false },
      { "filesize" },
    },
  },
  tabline = {
    lualine_a = { { "buffers", mode = 2 } },
    lualine_x = { "aerial" },
  },
  extensions = {
    "aerial",
    "man",
    "trouble",
  },
}
