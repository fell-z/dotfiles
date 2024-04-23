local config = {
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "comment",
    "css",
    "gdscript",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "html",
    "http",
    "ini",
    "javascript",
    "json",
    "lua",
    "make",
    "markdown",
    "python",
    "ruby",
    -- "sql",
    -- "typescript",
    "vim",
    "yaml"
  },
  sync_install = false,
  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml", "ruby", "python", "c", "java", "lua", "css" } },
  autotag = {
    enable = true,
    filetypes = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "vue",
      "tsx",
      "jsx",
      "xml",
      "markdown",
      "erb",
      "eruby"
    },
  },
  endwise = {
    enable = true,
  }
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = "TSUpdate",
    dependencies = {
      "RRethy/nvim-treesitter-endwise",
      "windwp/nvim-ts-autotag"
    },
    config = function ()
      require("nvim-treesitter.configs").setup(config)
    end
  },
}
