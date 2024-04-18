local working, configs = pcall(require, "nvim-treesitter.configs")
if not working then
  return
end

configs.setup {
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
  indent = { enable = true, disable = { "yaml", "ruby", "python", "c", "java", "lua" } },
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
