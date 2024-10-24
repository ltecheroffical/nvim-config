return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      ensure_installed = {
        -- Debuggers
        "codelldb",
        "debugpy"
      },
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        }
      }
    })
    mason_lspconfig.setup({
      ensure_installed = {
        "clangd",
        "pyright",
        "gopls",
        "cmake",
        "tsp_server",
        "lua_ls",
        "omnisharp"
      }
    })
  end,
}
