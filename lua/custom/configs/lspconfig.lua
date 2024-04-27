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
  -- Disable auto header insertion
  cmd = { "clangd", "--header-insertion=never" },
}

lspconfig.pyright.setup {}

lspconfig.gopls.setup({})

lspconfig.cmake.setup {}

lspconfig.tsserver.setup {}

lspconfig.htmx.setup {}

lspconfig.jdtls.setup({})

require("sonarlint").setup({
  server = {
    cmd = {
     'sonarlint-language-server',
     -- Ensure that sonarlint-language-server uses stdio channel
     '-stdio',
     '-analyzers',
     -- paths to the analyzers you need, using those for python and java in this example
     vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
     vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
     vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
    }
  },
  filetypes = {
    'python',
    'cpp',
    'c',
  }
})

