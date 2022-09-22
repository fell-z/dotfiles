local vim = vim

local map = function(mode, lhs, rhs, opts)
	local default_opts = { noremap = true }

	-- keep rightmost table value, opts, if there's a certain key in both tables
	if opts then
		default_opts = vim.tbl_extend("force", default_opts, opts)
	end

	vim.keymap.set(mode, lhs, rhs, default_opts)
end

vim.g.mapleader = " "

vim.g.user_emmet_leader_key = "<leader>i"

require("aerial").setup({
	backends = { "lsp" },
	on_attach = function(bufnr)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fs", "<cmd>Telescope aerial<CR>", {})
	end,
})

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fs", "<cmd>Telescope aerial<cr>")
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")

map({ "n", "v" }, "f", "<Plug>(leap-forward)")
map({ "n", "v" }, "F", "<Plug>(leap-backward)")

map("n", "<leader>d", "<cmd>Trouble<cr>")

map("n", "<leader>[", "<cmd>bp<cr>")
map("n", "<leader>]", "<cmd>bn<cr>")

map("n", "<leader>v", "<cmd>Neotree<cr>")

map("n", "<leader>t", "<cmd>edit term://zsh<cr>")
map("n", "<leader>spt", "<cmd>sp term://zsh<cr>")
map("t", "<Esc>", "<C-\\><C-n>")
