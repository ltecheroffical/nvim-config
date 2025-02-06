return {
    misc = {
        enable_quickmath = true
    },

    lsp_servers = {
        "clangd",
        "pyright",
        "gopls",
        "cmake",
        "ts_ls",
        "lua_ls",
        "omnisharp"
    },
    lsp_functions = {
        ["clangd"] = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            lspconfig.clangd.setup({
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "--suggest-missing-includes",
                    "--header-insertion=never"
                }
            })
        end,

        ["omnisharp"] = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            lspconfig.omnisharp.setup({
                capabilities = capabilities,
                cmd = { "omnisharp" }
            })
        end,

        ["jdtls"] = function()
        end,
    },
    debuggers = {
        "lldb",
        "debugpy"
    },
    plugins = {
        {
            "jacob411/Ollama-Copilot",
            keymaps = {
                suggestion = "<C-a>",
                reject = "<C-z>",
                insert_accept = "<C-c>"
            }
        }
    }
}
