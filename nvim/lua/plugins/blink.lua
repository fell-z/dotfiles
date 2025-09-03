return {
  "saghen/blink.cmp",
  enabled = false,
  event = "InsertEnter",
  version = "v1.*",
  opts_extend = { "sources.default" },
  opts = {
    keymap = {
      preset = "default",
      ["<C-,>"] = { "select_prev", "snippet_backward", "fallback" },
      ["<C-.>"] = { "select_next", "snippet_forward", "fallback" },
      ["<C-[>"] = { "scroll_documentation_up", "fallback" },
      ["<C-]>"] = { "scroll_documentation_down", "fallback" },
      ["<C-;>"] = { "cancel" },
      ["<C-/>"] = { "select_and_accept" },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "normal",
    },
    completion = {
      menu = {
        draw = {
          columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
          treesitter = { "lsp" },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      ghost_text = {
        enabled = true,
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
  },
  dependencies = {
    {
      "saghen/blink.compat",
      version = "*",
      opts = {},
    },
    {
      "garymjr/nvim-snippets",
      opts = {
        friendly_snippets = true,
      },
      dependencies = { "rafamadriz/friendly-snippets" },
    },
  },
}
