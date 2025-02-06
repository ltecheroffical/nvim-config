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
            "nomnivore/ollama.nvim",
            dependencies = {
              "nvim-lua/plenary.nvim",
            },

            -- All the user commands added by the plugin
            cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },

            keys = {
              -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
              {
                "<leader>oo",
                ":<c-u>lua require('ollama').prompt()<cr>",
                desc = "ollama prompt",
                mode = { "n", "v" },
              },

              -- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
              {
                "<leader>oG",
                ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
                desc = "ollama Generate Code",
                mode = { "n", "v" },
              },
            },

            ---@type Ollama.Config
            opts = {
                model = "deepseek-coder:1.3b",
                stream = true
            }
        }
    }
}
