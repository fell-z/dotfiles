return {
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
  { "catppuccin/nvim", name = "catppuccin", lazy = true },
  { "EdenEast/nightfox.nvim", lazy = true },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      { "kyazdani42/nvim-web-devicons", lazy = true },
    }
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
      require("ibl").setup {
        indent = { char = "│" },
        scope = { enabled = false }
      }
    end
  },

  "goolord/alpha-nvim",
}
