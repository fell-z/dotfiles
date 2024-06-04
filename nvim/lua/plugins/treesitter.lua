local config = {
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "diff",
    "gdscript",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "html",
    "http",
    "ini",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "jsonc",
    "lua",
    "luadoc",
    "luap",
    "make",
    "markdown",
    "markdown_inline",
    "python",
    "regex",
    "ruby",
    "rust",
    -- "sql",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "xml",
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
