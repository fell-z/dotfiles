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

local nvim_cmp_config = function()
  local cmp = require("cmp")
  local lspkind = require("lspkind")

  cmp.setup {
    formatting = {
      format = lspkind.cmp_format {
        mode = "symbol_text",
        before = trunc_completion_item,
      },
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

    sources = cmp.config.sources {
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "nvim_lsp_signature_help" },
      { name = "path" },
      { name = "buffer" },
      { name = "snippets" },
    },

    mapping = {
      ["<C-[>"] = cmp.mapping(cmp.mapping.scroll_docs(-3), { "i" }),
      ["<C-]>"] = cmp.mapping(cmp.mapping.scroll_docs(3), { "i" }),
      ["<C-;>"] = cmp.mapping { i = cmp.mapping.abort() },
      ["<C-/>"] = cmp.mapping.confirm { select = true },
      ["<C-.>"] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif vim.snippet.active { direction = 1 } then
          vim.schedule(function()
            vim.snippet.jump(1)
          end)
        else
          fallback()
        end
      end,
      ["<C-,>"] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.snippet.active { direction = -1 } then
          vim.schedule(function()
            vim.snippet.jump(-1)
          end)
        else
          fallback()
        end
      end,
    },
  }
end

return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "onsails/lspkind.nvim",
      {
        "garymjr/nvim-snippets",
        opts = {
          friendly_snippets = true,
        },
        dependencies = { "rafamadriz/friendly-snippets" },
      },
    },
    config = nvim_cmp_config,
  },
}
