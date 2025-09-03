return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      local themes = vim.g.themes or {}

      table.insert(themes, "tokyonight-storm")
      table.insert(themes, "tokyonight-day")

      vim.g.themes = themes
    end,
    config = function()
      require("tokyonight").setup {
        on_highlights = function(hl, c)
          hl.CursorLineNr = { fg = c.dark5 }
        end,
      }
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    init = function()
      local themes = vim.g.themes or {}

      table.insert(themes, "catppuccin-latte")
      table.insert(themes, "catppuccin-macchiato")

      vim.g.themes = themes
    end,
  },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = true,
    init = function()
      local themes = vim.g.themes or {}

      table.insert(themes, "everforest")

      vim.g.themes = themes
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      bold = false,
      contrast = "soft",
    },
    lazy = true,
    init = function()
      local themes = vim.g.themes or {}

      table.insert(themes, "gruvbox")

      vim.g.themes = themes
    end,
  },
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = {
      "rktjmp/lush.nvim",
    },
    lazy = true,
    init = function()
      local themes = vim.g.themes or {}

      table.insert(themes, "zenwritten")
      table.insert(themes, "zenbones")

      vim.g.themes = themes
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = {
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
    },
    dependencies = {
      { "kyazdani42/nvim-web-devicons", lazy = true },
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    config = function()
      require("ibl").setup {
        indent = { char = "│" },
        scope = { enabled = false },
      }
    end,
  },

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "goolord/alpha-nvim",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      local header_image = {}
      for line in io.lines(vim.fn.stdpath("config") .. "/header.txt") do
        table.insert(header_image, line)
      end

      dashboard.section.header.val = header_image

      dashboard.section.buttons.val = {
        dashboard.button("e", "󰈔 New file", ":ene<CR>"),
        dashboard.button("SPC f f", "󰱼 Find files"),
        dashboard.button("SPC f r", "󱋡 Recent files", ":Telescope oldfiles<CR>"),
        dashboard.button("q", "󰩈 Quit", ":qa<CR>"),
      }

      alpha.setup(dashboard.config)
    end,
  },
}
