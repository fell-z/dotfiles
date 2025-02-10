local wk = require("which-key")

wk.add({
  { "<leader>e", group = "edit", icon = "󱇧" },
  { "<leader>f", group = "find" },
  { "<leader>x", group = "others", icon = "󰇙" },
  { "<leader>s", group = "set", icon = "" },
  { "<leader>d", group = "trouble" },
  { "<leader>dt", group = "test" },

  { "<leader>st", require("util").set_theme, desc = "Set theme", icon = "" },

  { "<leader>[", "<cmd>bp<cr>", desc = "Previous buffer" },
  { "<leader>]", "<cmd>bn<cr>", desc = "Next buffer" },
  { "<leader>t", "<cmd>terminal<cr>", desc = "Open a terminal buffer" },
  { "<Esc>", "<C-\\><C-n>", mode = "t", noremap = true },
})
