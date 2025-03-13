return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        arduino_language_server = {},
        basedpyright = {},
        bashls = {},
        csharp_ls = {},
        cssls = {},
        clangd = {
          cmd = {
            "clangd",
            "--clang-tidy",
            "--completion-style=detailed",
            "--function-arg-placeholders",
          },
        },
        emmet_language_server = {},
        html = {},
        jdtls = {},
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = "Ask",
                library = {
                  "/usr/lib/lua/5.4/",
                },
              },
            },
          },
        },
        marksman = {},
        pyre = {},
        rust_analyzer = {},
        sqls = {},
        solargraph = {
          single_file_support = true,
        },
        texlab = {
          settings = {
            texlab = {
              build = {
                executable = "tectonic",
                args = { "-X", "compile", "%f", "--synctex", "--keep-logs", "--keep-intermediates" },
              },
              chktex = {
                onEdit = true,
              },
            },
          },
        },
        vtsls = {},
      },
    },
    config = function(_, opts)
      require("mason").setup()
      require("mason-lspconfig").setup()

      local lsp = require("lspconfig")

      -- Set the gutter diagnostics icons
      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, linehl = "", numhl = "" })
      end

      local servers = opts.servers
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local has_blink, blink = pcall(require, "blink.cmp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        has_cmp and cmp_nvim_lsp.default_capabilities() or {},
        has_blink and blink.get_lsp_capabilities() or {},
        opts.capabilities or {}
      )

      for server, config in pairs(servers) do
        config.capabilities = capabilities
        lsp[server].setup(config)
      end
    end,
  },
}
