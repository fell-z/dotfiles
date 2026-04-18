return {
  { "IogaMaster/neocord", event = "VeryLazy", opts = {} },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 1000
    end,
    opts = {},
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "olimorris/neotest-rspec",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require("neotest-rspec"),
        },
      }
    end,
    -- stylua: ignore
    keys = {
      { "<leader>dtn", function() require("neotest").run.run() end, desc = "Run current hovered test (Neotest)" },
      { "<leader>dtf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run current test file (Neotest)" },
      {
        "<leader>dts", function() require("neotest").run.run(vim.fn.getcwd()) end,
      	desc = "Run test suite (current directory) (Neotest)"
      }
    },
  },

  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>ft",
        "<cmd>TodoTelescope<cr>",
        mode = "n",
        desc = "Find todo comments (telescope)",
      },
    },
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      stages = "static",
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
    },
    init = function()
      vim.notify = require("notify")
    end,
    keys = {
      {
        "<leader>xn",
        function()
          require("notify").dismiss { silent = true, pending = true }
        end,
        desc = "Dismiss All Notifications",
      },
    },
  },

  {
    "tpope/vim-rails",

    cond = function()
      if vim.fn.executable("bundle") ~= 1 then
        return false
      end

      local exec = require("lazy.manage.process").exec

      local _, code = exec("bundle", { args = { "exec", "rails", "--version" } })

      return code == 0
    end
  },

  {
    "tpope/vim-dispatch",
    event = "VeryLazy",
  },
}
