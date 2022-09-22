local vim = vim

if vim.fn.has("termguicolors") == 1 then
  vim.opt.termguicolors = true
end

vim.g.ruby_operators = 1
vim.g.ruby_pseudo_operators = 1

vim.opt.completeopt = "menu,menuone,preview,noselect"

vim.opt.foldenable = true
vim.opt.foldmethod = "manual"

vim.opt.textwidth = 100
vim.opt.wrap = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.scrolloff = 12

vim.opt.numberwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.showmode = true
vim.opt.title = true

vim.opt.guicursor = "n-c-i-ci-r-cr-o:hor10,v-ve:block,a:blinkwait700-blinkoff400-blinkon250-Cursor,sm:block-blinkwait175-blinkoff150-blinkon175"

