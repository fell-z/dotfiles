if vim.fn.has("termguicolors") == 1 then
  vim.opt.termguicolors = true
end

vim.opt.completeopt = { "menu", "menuone", "preview", "noselect" }
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.foldenable = true
vim.opt.foldmethod = "manual"
vim.opt.guicursor =
  "n-c-i-ci-r-cr-o:hor10,v-ve:block,a:blinkwait700-blinkoff400-blinkon250-Cursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.relativenumber = true
vim.opt.scrolloff = 12
vim.opt.shiftwidth = 2
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.textwidth = 100
vim.opt.title = true
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.wrap = true
