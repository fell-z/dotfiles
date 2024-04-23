return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzy-native.nvim",
      {
        "stevearc/aerial.nvim",
        config = function ()
          require("aerial").setup({
            backends = { "lsp" },
            on_attach = function(bufnr)
              vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fs", "<cmd>Telescope aerial<CR>", {})
            end,
          })
        end
      }
    },
    config = function ()
      require("telescope").load_extension("aerial")
    end,
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", mode = "n" },
      { "<leader>fs", "<cmd>Telescope aerial<cr>", mode = "n" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", mode = "n" },
    }
  }
}
