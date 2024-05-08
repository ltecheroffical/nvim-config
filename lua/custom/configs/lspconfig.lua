local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")

lspconfig.clangd.setup {
  on_attach = function (client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  -- Disable auto heade r insertion
  cmd = { "clangd", "--header-insertion=never" },
}
lspconfig.cmake.setup {}

lspconfig.pyright.setup {}

lspconfig.gopls.setup({})


lspconfig.tsserver.setup {}

lspconfig.htmx.setup {}

lspconfig.jdtls.setup({})
