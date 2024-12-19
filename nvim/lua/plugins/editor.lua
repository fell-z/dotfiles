return {
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    opts = { use_diagnostic_signs = true },
    cmd = "Trouble",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    keys = {
      {
        "<leader>dd",
        "<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>",
        mode = "n",
        desc = "See buffer diagnostics (Trouble)",
      },
      {
        "<leader>ds",
        "<cmd>Trouble lsp_document_symbols toggle focus=true win.position=right<cr>",
        mode = "n",
        desc = "See symbols (Trouble)",
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    opts = {
      events = { "BufWritePost", "BufReadPost", "InsertLeave", "TextChanged" },
      linters_by_ft = {
        --- css = { "stylelint" },
        html = { "htmlhint" },
        javascript = { "eslint_d" },
        python = { "ruff" },
        ruby = { "rubocop" },
        sh = { "shellcheck" },
      },
    },
    config = function(_, opts)
      local lint = require("lint")

      local debounce = function(ms, fn)
        local timer = vim.uv.new_timer()
        return function()
          local argv = {}
          timer:start(ms, 0, function()
            timer:stop()
            vim.schedule_wrap(fn)(unpack(argv))
          end)
        end
      end

      lint.linters_by_ft = opts.linters_by_ft

      vim.api.nvim_create_autocmd(opts.events, {
        group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
        callback = debounce(100, lint.try_lint),
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    config = function()
      local web_fmts = { "prettierd", "prettier", stop_after_first = true }

      require("conform").formatters = {
        ["clang-format"] = {
          prepend_args = function(self, ctx)
            local filetype = vim.api.nvim_get_option_value("filetype", { buf = ctx.buf })

            if filetype == "java" then
              return { "--style=InheritParentConfig" }
            end

            return {}
          end,
        },
      }

      require("conform").setup {
        formatters_by_ft = {
          html = web_fmts,
          css = web_fmts,
          javascript = web_fmts,
          typescript = web_fmts,
          c = { "clang-format" },
          cpp = { "clang-format" },
          java = { "clang-format" },
          lua = { "stylua" },
          ruby = { "rubocop" },
          eruby = { "erb_format" },
          python = { "ruff_format", "ruff_organize_imports" },
          sh = { "shfmt" },
        },
      }
    end,
    keys = {
      {
        "<leader>ex",
        function()
          require("conform").format { async = true, lsp_fallback = true }
        end,
        desc = "Format buffer (conform)",
      },
    },
  },

  -- stylua: ignore start
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<C-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  -- stylua: ignore end

  {
    "lewis6991/gitsigns.nvim",
    opts = {},
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },

  {
    "folke/zen-mode.nvim",
    dependencies = { "folke/twilight.nvim" },
    cmd = "ZenMode",
    opts = {},
  },

  {
    "brenoprata10/nvim-highlight-colors",
    ft = { "css", "less", "sass", "scss", "html", "javascriptreact", "typescriptreact" },
    opts = {},
  },

  {
    "olrtg/nvim-emmet",
    ft = {
      "css",
      "eruby",
      "html",
      "javascript",
      "javascriptreact",
      "less",
      "sass",
      "scss",
      "pug",
      "typescriptreact",
    },
    keys = {
      {
        "<leader>xe",
        function()
          require("nvim-emmet").wrap_with_abbreviation()
        end,
        mode = { "n", "v" },
        desc = "Emmet: Wrap with abbreviation",
      },
    },
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      local npairs = require("nvim-autopairs")

      npairs.setup { check_ts = true }

      require("cmp").event:on(
        "confirm_done",
        require("nvim-autopairs.completion.cmp").on_confirm_done()
      )
    end,
  },
}
