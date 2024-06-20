return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {},
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "basedpyright",
        "bashls",
        "clangd",
        "lua_ls",
        "solargraph",
        "tsserver",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local lsp = require("lspconfig")

      -- Set the gutter diagnostics icons
      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, linehl = "", numhl = "" })
      end

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lsp.asm_lsp.setup {
        capabilities = capabilities,
      }
      lsp.basedpyright.setup {
        capabilities = capabilities,
      }
      lsp.bashls.setup {
        capabilities = capabilities,
      }
      lsp.clangd.setup {
        capabilities = capabilities,
        cmd = {
          "clangd",
          "--clang-tidy",
          "--completion-style=detailed",
          "--function-arg-placeholders",
        }
      }
      lsp.csharp_ls.setup {
        capabilities = capabilities,
      }
      lsp.cssls.setup {
        capabilities = capabilities,
      }
      lsp.emmet_language_server.setup {
        capabilities = capabilities,
      }
      --[[
      lsp.gdscript.setup {
        capabilities = capabilities,
      }
      ]]
      --
      lsp.html.setup {
        capabilities = capabilities,
        cmd = { "vscode-html-language-server", "--stdio" },
      }
      lsp.lua_ls.setup {
        capabilities = capabilities,
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
      }
      lsp.rust_analyzer.setup {
        capabilities = capabilities,
      }
      lsp.pyre.setup {
        capabilities = capabilities,
      }
      lsp.solargraph.setup {
        capabilities = capabilities,
        single_file_support = true,
      }
      lsp.texlab.setup {
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
      }
      --[[
      lsp.tsserver.setup {
        capabilities = capabilities,
        single_file_support = true,
      }
      ]]--
      lsp.vtsls.setup {
        capabilities = capabilities,
      }
    end,
  },
}
