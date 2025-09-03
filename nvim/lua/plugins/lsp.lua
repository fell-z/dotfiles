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
            "--function-arg-placeholders=1",
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

      -- Set the gutter diagnostics icons
      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
          }
        }
      })

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
        vim.lsp.config(server, config)

        vim.lsp.enable(server)
      end
    end,
  },
}
