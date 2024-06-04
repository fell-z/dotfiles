return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = vim.fn.executable("make") == 1 and "make"
          or "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        enabled = vim.fn.executable("make") == 1 or vim.fn.executable("cmake") == 1,
      },
      {
        "stevearc/aerial.nvim",
        config = function ()
          require("aerial").setup({
            backends = {
              ["_"] = { "treesitter", "lsp" },
              typescript = { "lsp", "treesitter" },
            }
          })
        end
      }
    },
    config = function ()
      require("telescope").load_extension("aerial")
      require("telescope").load_extension("fzf")
    end,
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", mode = "n", desc = "Find files (telescope)" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", mode = "n", desc = "Find buffers (telescope)" },
      { "<leader>fs", "<cmd>Telescope aerial<cr>", mode = "n", desc = "Find symbols (telescope)" }
    },
    event = "VeryLazy"
  }
}
