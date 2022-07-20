local vim = vim

vim.g.python3_host_prog = "/home/fell/.pyenv/shims/python3"

vim.cmd("filetype plugin indent on")

require "options"
require "keymap"
require "visual"
require "plugins"
require "treesitter"
require "lsp"
require "autopairs"

vim.cmd([[
  augroup C
    autocmd!

    au FileType c set shiftwidth=4
  augroup END

  augroup Python
    autocmd!

    au FileType python set shiftwidth=4
  augroup END
]])
