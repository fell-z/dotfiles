local vim = vim

require "impatient"

vim.g.python3_host_prog = os.getenv("PYTHON_EXECUTABLE")

vim.cmd("filetype plugin indent on")

require "options"
require "keymap"
require "visual"
require "plugins"
require "treesitter"
require "lsp"
require "autopairs"

local langs = {
  c = {
    augroup = vim.api.nvim_create_augroup("C", { clear = true }),
    pattern = { "*.c", "*.h" },
    config = function ()
      vim.opt.shiftwidth = 4
    end,
  },
  python = {
    augroup = vim.api.nvim_create_augroup("Python", { clear = true }),
    pattern = { "*.py", "*.pyw" },
    config = function ()
      vim.opt.shiftwidth = 4
    end,
  },
}

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = langs.c.pattern,
  group = langs.c.augroup,
  callback = langs.c.config,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = langs.python.pattern,
  group = langs.python.augroup,
  callback = langs.python.config,
})
