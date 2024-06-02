return {
  {
    "folke/zen-mode.nvim",
    dependencies = { "folke/twilight.nvim" },
    cmd = "ZenMode",
    opts = {},
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },

  { "brenoprata10/nvim-highlight-colors", opts = {}, },

  { "lewis6991/gitsigns.nvim", opts = {}, },

  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
    cmd = "Trouble",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    keys = {
      {
        "<leader>dd", "<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>",
        mode = "n",
        desc = "See buffer diagnostics (Trouble)"
      },
      {
        "<leader>ds", "<cmd>Trouble lsp_document_symbols toggle focus=true win.position=right<cr>",
        mode = "n",
        desc = "See symbols (Trouble)"
      },
    }
  },

--[[
  {
    "ggandor/leap.nvim",
    keys = {
      { "f", "<Plug>(leap-forward)", mode = { "n", "v" }, desc = "Search forward" },
      { "F", "<Plug>(leap-backward)", mode = { "n", "v" }, desc = "Search backward"}
    },
  },
  ]]--

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

  {
    "olrtg/nvim-emmet",
    ft = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact" },
    keys = {
      {
        "<leader>xe",
        function ()
          require("nvim-emmet").wrap_with_abbreviation()
        end,
        mode = { "n", "v" },
        desc = "Emmet: Wrap with abbreviation"
      }
    }
  },

  {
    "stevearc/conform.nvim",
    config = function ()
      local web_fmts = { { "prettierd", "prettier" } }

      require("conform").setup {
        formatters_by_ft = {
          lua = { "stylua" },
          ruby = { "rubocop" },
          html = web_fmts,
          css = web_fmts,
          javascript = web_fmts,
          typescript = web_fmts,
        }
      }
    end,
    keys = {
      {
        "<leader>fmt",
        function ()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        desc = "Format buffer",
      }
    }
  },

  {
    "windwp/nvim-autopairs",
    config = function ()
      local npairs_working, npairs = pcall(require, "nvim-autopairs")
      if not npairs_working then
        return
      end


      npairs.setup {
        check_ts = true,
        disable_filetype = { "TelescopePrompt" },
      }

      local cmp_npairs = require "nvim-autopairs.completion.cmp"
      local cmp_working, cmp = pcall(require, "cmp")
      if not cmp_working then
        return
      end

      cmp.event:on(
        "confirm_done",
        cmp_npairs.on_confirm_done()
      )

      local rule_working, Rule = pcall(require, "nvim-autopairs.rule")
      if not rule_working then
        return
      end

      npairs.add_rules {
        Rule(' ', ' ')
          :with_pair(function (opts)
            local pair = opts.line:sub(opts.col - 1, opts.col)
            return vim.tbl_contains({ '()', '[]', '{}' }, pair)
          end),
        Rule('( ', ' )')
            :with_pair(function() return false end)
            :with_move(function(opts)
                return opts.prev_char:match('.%)') ~= nil
            end)
            :use_key(')'),
        Rule('{ ', ' }')
            :with_pair(function() return false end)
            :with_move(function(opts)
                return opts.prev_char:match('.%}') ~= nil
            end)
            :use_key('}'),
        Rule('[ ', ' ]')
            :with_pair(function() return false end)
            :with_move(function(opts)
                return opts.prev_char:match('.%]') ~= nil
            end)
            :use_key(']')
      }
    end
  },
}
