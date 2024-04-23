return {
  {
    "folke/zen-mode.nvim",
    dependencies = { "folke/twilight.nvim" },
    config = function()
      require("zen-mode").setup {}
    end,
    cmd = "ZenMode"
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function ()
      require("nvim-surround").setup {}
    end
  },

  {
    "brenoprata10/nvim-highlight-colors",
    config = function ()
      require("nvim-highlight-colors").setup {}
    end
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function ()
      require("gitsigns").setup {}
    end
  },

  {
    "folke/trouble.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    keys = {
      { "<leader>d", "<cmd>Trouble<cr>", mode = "n" }
    }
  },

  {
    "ggandor/leap.nvim",
    keys = {
      { "f", "<Plug>(leap-forward)", mode = { "n", "v" } },
      { "F", "<Plug>(leap-backward)", mode = { "n", "v" } }
    }
  },

  "windwp/nvim-autopairs"
}
