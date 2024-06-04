-- I have no idea of how this work step by step,
-- but i know that's necessary for the 'Super Tab' work better
local check_backspace = function ()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local trunc_completion_item = function(_, vim_item)
  local ABBR_MAX_WIDTH = 20
  local MENU_MAX_WIDTH = 25
  local ELLIPSIS_CHAR = "..."

  local menu = vim_item.menu
  local abbr = vim_item.abbr

  if menu ~= nil and #menu > MENU_MAX_WIDTH then
    vim_item.menu = vim.fn.strcharpart(menu, 0, MENU_MAX_WIDTH) .. ELLIPSIS_CHAR
  end

  if abbr ~= nil and #abbr > ABBR_MAX_WIDTH then
    vim_item.abbr = vim.fn.strcharpart(abbr, 0, ABBR_MAX_WIDTH) .. ELLIPSIS_CHAR
  end

  return vim_item
end

local nvim_cmp_config = function ()
  local cmp = require("cmp")
  local lspkind = require("lspkind")
  local luasnip = require("luasnip")

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end
    },

    formatting = {
      format = lspkind.cmp_format({
        mode = "symbol_text",
        before = trunc_completion_item
      }),
    },

    window = {
      completion = {
        border = "single",
        col_offset = 3,
      },
      documentation = {
        border = "single",
        max_width = 55,
      },
    },

    mapping = {
      ['<C-,>'] = cmp.mapping(cmp.mapping.scroll_docs(-3), { 'i' }),
      ['<C-.>'] = cmp.mapping(cmp.mapping.scroll_docs(3), { 'i' }),
      -- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i' }),
      ['<C-;>'] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
      ['<C-/>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expandable() then
          luasnip.expand()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif check_backspace() then
          fallback()
        else
          fallback()
        end
      end,
      ['<S-Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end,
    },
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "path" },
      { name = "buffer" },
      { name = "nvim_lua" },
      { name = "nvim_lsp_signature_help" }
    })
  })
end

return {
  -- Autocompletion system
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "onsails/lspkind.nvim",
    },
    config = nvim_cmp_config
  },

  -- Snippet engine
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function ()
          require("luasnip.loaders.from_vscode").lazy_load()
        end
      },
      {
        "nvim-cmp",
        dependencies = {
          "saadparwaiz1/cmp_luasnip",
        },
      }
    }
  }
}
