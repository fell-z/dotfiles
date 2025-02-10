return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    config = function() end,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function() end,
    opts = {
      ensure_installed = {
        "basedpyright",
        "bashls",
        "clangd",
        "lua_ls",
        "solargraph",
        "vtsls",
      },
    },
  },
}
