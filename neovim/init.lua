local vim = vim

vim.g.python3_host_prog = "/home/fell/.pyenv/shims/python3"

vim.cmd("filetype plugin indent on")

require "options"
require "keymap"
require "visual"
require "plugins"
require "lsp"

vim.cmd([[
  augroup C
    autocmd!

    au FileType c set shiftwidth=4
  augroup END

  augroup Python
    autocmd!

    au FileType python set foldmethod=indent
    au FileType python set shiftwidth=4
  augroup END

  augroup Ruby
    autocmd!

    au FileType ruby set foldmethod=syntax
  augroup END

  augroup Web
    autocmd!

    au FileType javascript set foldmethod=syntax
    au FileType css set foldmethod=syntax
  augroup END
]])
