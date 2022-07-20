local vim = vim

local map = function (mode, lhs, rhs, opts)
  local default_opts = { noremap = true }

  -- keep rightmost table value, opts, if there's a certain key in both tables
  if opts then default_opts = vim.tbl_extend('force', default_opts, opts) end

  vim.keymap.set(mode, lhs, rhs, default_opts)
end

vim.g.mapleader = '\\'

--[[
local switch_theme = function ()
  if vim.g.colors_name == vim.g.default_theme then
    vim.cmd(string.format('colorscheme %s', vim.g.alt_theme))
  else
    vim.cmd(string.format('colorscheme %s', vim.g.default_theme))
  end
end
]]--

require("aerial").setup {
  backends = { "lsp" },
  on_attach = function(bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>o', '<cmd>AerialToggle float<CR>', {})
  end,
  close_on_select = true,
  width = 20,
}

-- map('n', '<leader>sth', switch_theme)

vim.g.user_emmet_leader_key = "<leader>i"

map('n', '<leader>d', '<cmd>Trouble<cr>')

map('n', '<leader>[', '<cmd>bp<cr>')
map('n', '<leader>]', '<cmd>bn<cr>')

map('n', '<leader>v', '<cmd>Neotree<cr>')

map('n', '<leader>t', '<cmd>edit term://zsh<cr>')
map('n', '<leader>spt', '<cmd>sp term://zsh<cr>')
map('t', '<Esc>', '<C-\\><C-n>')
