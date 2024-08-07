local vim = vim

if vim.fn.has("termguicolors") == 1 then
  vim.opt.termguicolors = true
end

vim.g.ruby_operators = 1
vim.g.ruby_pseudo_operators = 1

vim.opt.completeopt = { "menu", "menuone", "preview", "noselect" }

vim.o.foldenable = true
vim.o.foldmethod = "manual"

vim.o.textwidth = 100
vim.o.wrap = true

vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2

vim.o.scrolloff = 12

vim.o.numberwidth = 2
vim.o.signcolumn = "yes"
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.showmode = true
vim.o.title = true

vim.o.guicursor =
  "n-c-i-ci-r-cr-o:hor10,v-ve:block,a:blinkwait700-blinkoff400-blinkon250-Cursor,sm:block-blinkwait175-blinkoff150-blinkon175"
