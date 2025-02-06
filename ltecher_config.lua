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
            "huynle/ogpt.nvim",
             event = "VeryLazy",
             opts = {
               default_provider = "ollama",
               providers = {
                 ollama = {
                    api_host = os.getenv("OLLAMA_API_HOST") or "http://localhost:11434",
                    api_key = os.getenv("OLLAMA_API_KEY") or "",
                    api_params = {
                        model = "deepseek-coder:1.3b"
                    }
                 }
               }
             },
             dependencies = {
               "MunifTanjim/nui.nvim",
               "nvim-lua/plenary.nvim",
               "nvim-telescope/telescope.nvim"
             }
        }
    }
}
