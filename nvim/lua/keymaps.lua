local vim = vim

local map = function(mode, lhs, rhs, opts)
	local default_opts = { noremap = true }

	-- keep rightmost table value, opts, if there's a certain key in both tables
	if opts then
		default_opts = vim.tbl_extend("force", default_opts, opts)
	end

	vim.keymap.set(mode, lhs, rhs, default_opts)
end

map("n", "<leader>[", "<cmd>bp<cr>")
map("n", "<leader>]", "<cmd>bn<cr>")

map("n", "<leader>t", "<cmd>edit term://zsh<cr>")
map("n", "<leader>spt", "<cmd>sp term://zsh<cr>")
map("t", "<Esc>", "<C-\\><C-n>")
