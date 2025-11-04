return {
  {
    "mason-org/mason.nvim",
    lazy = false,
    cmd = "Mason",
    build = ":MasonUpdate",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    config = function (_, opts)
      require("mason").setup()
      require("mason-lspconfig").setup(opts)
    end,
    opts = {
      automatic_enable = false,
      ensure_installed = {
        "basedpyright",
        "bashls",
        "clangd",
        "lua_ls",
        "solargraph",
        "vtsls",
      },
    },
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
  },
}
