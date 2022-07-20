local vim = vim

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer... close and reopen Neovim."
  vim.cmd [[packadd packer.nvim]]
end

local working, packer = pcall(require, 'packer')
if not working then
  vim.notify("Oopsie! packer doesn't seem to be installed.", vim.log.levels.ERROR)
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end
  }
}

return packer.startup(function(use)

  -- Autocompletion system
  use "onsails/lspkind.nvim"
  use "neovim/nvim-lspconfig"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua" -- Neovim api completions
  use "hrsh7th/cmp-buffer" -- Buffer completions
  use "hrsh7th/cmp-path" -- Path completions
  use "hrsh7th/cmp-cmdline" -- Cmdline completions
  use "hrsh7th/nvim-cmp" -- Completion engine
  -- Snippet engine
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip" -- Luasnip integration with nvim-cmp plugin
  use "rafamadriz/friendly-snippets"

  -- Neovim-only plugins
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"
  use "gpanders/editorconfig.nvim"
  use 'stevearc/aerial.nvim'
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzy-native.nvim"
    }
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }

  -- Visual 
  use "EdenEast/nightfox.nvim"
  use "folke/tokyonight.nvim"
  use "folke/lsp-colors.nvim"
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    "ap/vim-css-color",
    ft = { "css" },
  }
  use {
    "hail2u/vim-css3-syntax",
    ft = { "css" },
  }

  -- QOL plugins
  use {
    "mattn/emmet-vim",
    ft = { "html" },
  }
  use "RRethy/nvim-treesitter-endwise"
  use "windwp/nvim-ts-autotag"
  use "lukas-reineke/indent-blankline.nvim"
  use {
    "folke/zen-mode.nvim",
    requires = { "folke/twilight.nvim" },
    config = function()
      require("zen-mode").setup {}
    end
  }
  use "windwp/nvim-autopairs"

  -- Others

  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)
