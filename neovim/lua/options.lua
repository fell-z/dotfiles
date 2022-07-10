local vim = vim

if vim.fn.has("termguicolors") == 1 then
  vim.opt.termguicolors = true
end

vim.opt.completeopt = "menu,menuone,preview,noselect"

vim.opt.foldenable = true
vim.opt.foldlevelstart = 2
vim.opt.foldnestmax = 4

vim.opt.textwidth = 100
vim.opt.wrap = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.scrolloff = 12

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.showmode = true
vim.opt.title = true

vim.opt.guicursor = "n-c-i-ci-r-cr-o:hor10,v-ve:block,a:blinkwait700-blinkoff400-blinkon250-Cursor,sm:block-blinkwait175-blinkoff150-blinkon175"

