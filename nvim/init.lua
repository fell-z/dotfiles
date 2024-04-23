local vim = vim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.python3_host_prog = "$HOME/.pyenv/shims/python3"
vim.g.mapleader = " "

require("lazy").setup("plugins")

vim.loader.enable()

vim.cmd("filetype plugin indent on")

require "options"
require "keymaps"
require "ui"
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
