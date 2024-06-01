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
    "rust",
    -- "sql",
    "typescript",
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
  indent = { enable = true, disable = { "yaml", "ruby", "python", "c", "java", "lua", "css", "html" } },
  endwise = {
    enable = true,
  }
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      {
        "windwp/nvim-ts-autotag",
        opts = {},
      },
      "RRethy/nvim-treesitter-endwise",
    },
    config = function ()
      require("nvim-treesitter.configs").setup(config)
    end
  },
}
