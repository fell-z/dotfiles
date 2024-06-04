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

-- limit lazydev.nvim using exrc
vim.opt.exrc = true
vim.g.lazydev_enabled = false

require("lazy").setup("plugins")

vim.loader.enable()

vim.cmd("filetype plugin indent on")

require "options"
require "keymaps"
require "ui"
require "autocmds"
