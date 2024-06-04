local wk = require("which-key")

wk.register(
  {
    ["e"] = { name = "+edit" },
    ["f"] = { name = "+find" },
    ["d"] = { name = "+trouble" },
    ["x"] = { name = "+others" },

    ["["] = { "<cmd>bp<cr>", "Previous buffer" },
    ["]"] = { "<cmd>bn<cr>", "Next buffer" },
    ["t"] = { "<cmd>terminal<cr>", "Open a terminal buffer" },
  },
  { prefix = "<leader>", mode = "n" }
)

-- this mapping doesn't work as expected with which-key, don't know how to fix. Strange
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
