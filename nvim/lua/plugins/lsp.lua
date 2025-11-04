return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        arduino_language_server = {
          cmd = {
            "arduino-language-server",
            "-clangd", "clangd",
            "-cli", "arduino-cli",
            "-cli-config", vim.fn.expand("~") .. "/.arduino15/arduino-cli.yaml",
            "-fqbn", "arduino:avr:uno"
          }
        },
        basedpyright = {},
        bashls = {},
        csharp_ls = {},
        cssls = {},
        clangd = {},
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
      -- Set the gutter diagnostics icons
      vim.diagnostic.config({
        virtual_text = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
          },
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
