local config = {
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "diff",
    "embedded_template",
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
    "sql",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "xml",
    "yaml",
  },
  sync_install = false,
  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
    disable = { "yaml", "ruby", "python", "c", "cpp", "java", "lua", "css", "sh", "html" },
  },
  endwise = {
    enable = true,
  },
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      {
        "windwp/nvim-ts-autotag",
        config = function()
          require("nvim-ts-autotag").setup {
            per_filetype = {
              ["eruby"] = {
                enable_close = true,
                enable_rename = true,
                enable_close_on_slash = false,
              }
            }
          }
        end,
      },
      "RRethy/nvim-treesitter-endwise",
    },
    config = function()
      require("nvim-treesitter.configs").setup(config)
    end,
  },
}
