local vim = vim

require "plugins"

vim.loader.enable()

vim.g.python3_host_prog = "$HOME/.pyenv/shims/python3"

vim.cmd("filetype plugin indent on")

require "options"
require "keymap"
require "visual"
require "treesitter"
require "lsp"
require "autopairs"
require "greeter"

local langs = {
  c = {
    augroup = vim.api.nvim_create_augroup("C", { clear = true }),
    pattern = { "*.c", "*.h" },
    config = function ()
      vim.opt.shiftwidth = 4
    end,
  },
  cpp = {
    augroup = vim.api.nvim_create_augroup("Cpp", { clear = true }),
    pattern = { "*.cpp", "*.hpp" },
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
  pattern = langs.cpp.pattern,
  group = langs.cpp.augroup,
  callback = langs.cpp.config,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = langs.python.pattern,
  group = langs.python.augroup,
  callback = langs.python.config,
})
