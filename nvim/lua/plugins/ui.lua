return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup {
        on_highlights = function(hl, c)
          hl.CursorLineNr = { fg = c.dark5 }
        end,
      }
    end,
  },
  { "catppuccin/nvim", name = "catppuccin", lazy = true },
  { "neanias/everforest-nvim", version = false, lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },
  { "cvigilv/patana.nvim", opts = {}, lazy = true },
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      bold = false,
      contrast = "soft",
    },
    lazy = true,
  },
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = {
      "rktjmp/lush.nvim",
    },
    lazy = true,
  },

  {
    "nvim-lualine/lualine.nvim",
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

  {
    "echasnovski/mini.icons",
    opts = {},
    lazy = true,
    specs = {
      { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        -- needed since it will be false when loading and mini will fail
        package.loaded["nvim-web-devicons"] = {}
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },
}
