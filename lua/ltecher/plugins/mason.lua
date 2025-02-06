return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local config = require("ltecher.core.config")

    mason.setup({
      ensure_installed = config.debuggers,
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        }
      }
    })
    mason_lspconfig.setup({
      ensure_installed = config.lsp_servers
    })
  end,
}
