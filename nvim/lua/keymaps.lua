local wk = require("which-key")

wk.add({
  { "<leader>e", group = "edit" },
  { "<leader>f", group = "find" },
  { "<leader>x", group = "others" },
  { "<leader>s", group = "switch" },
  { "<leader>d", group = "trouble" },
  { "<leader>dt", group = "test" },

  { "<leader>[", "<cmd>bp<cr>", desc = "Previous buffer" },
  { "<leader>]", "<cmd>bn<cr>", desc = "Next buffer" },
  { "<leader>t", "<cmd>terminal<cr>", desc = "Open a terminal buffer" },
  { "<Esc>", "<C-\\><C-n>", mode = "t", noremap = true },
})
