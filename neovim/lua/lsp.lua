local vim = vim
local lsp = require "lspconfig"
local cmp = require "cmp"
local lspkind = require "lspkind"
local luasnip = require "luasnip"

-- I have no idea of how this work step by step,
-- but i know that's necessary for the 'Super Tab' work better
local check_backspace = function ()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end
  },

  formatting = {
    format = lspkind.cmp_format({
        maxwidth = 40,
        mode = "symbol_text",
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
    ['<A-k>'] = cmp.mapping(cmp.mapping.scroll_docs(-3), { 'i' }),
    ['<A-l>'] = cmp.mapping(cmp.mapping.scroll_docs(3), { 'i' }),
    -- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i' }),
    ['<A-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
    ['<A-z>'] = cmp.mapping.confirm({ select = true }),
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
  })
})

require("luasnip.loaders.from_vscode").lazy_load()

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp.bashls.setup {
  capabilities = capabilities,
  on_attach = require("aerial").on_attach,
}

lsp.pyright.setup {
  capabilities = capabilities,
  on_attach = require("aerial").on_attach,
}
lsp.html.setup {
  capabilities = capabilities,
  cmd = { "vscode-html-language-server", "--stdio"},
  on_attach = require("aerial").on_attach,
}
lsp.sumneko_lua.setup {
  capabilities = capabilities,
  on_attach = require("aerial").on_attach,
}
lsp.clangd.setup {
  capabilities = capabilities,
  on_attach = require("aerial").on_attach,
}
lsp.solargraph.setup {
  capabilities = capabilities,
  on_attach = require("aerial").on_attach,
}
--[[
lsp.flow.setup {
  capabilities = capabilities,
  on_attach = require("aerial").on_attach,
  cmd = { "npx", "--no-install", "flow-bin", "lsp" },
}
  ]]--
lsp.tsserver.setup {
  capabilities = capabilities,
  on_attach = require("aerial").on_attach,
  single_file_support = true,
}
lsp.cssls.setup {
  capabilities = capabilities,
  on_attach = require("aerial").on_attach,
}
