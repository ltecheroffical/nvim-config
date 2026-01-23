return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				-- Docs
				"vimdoc",

				-- Languages
				"cpp",
				"lua",
				"vim",
				"c",
				"c_sharp",

				"python",

				-- Git
				"git_config",
				"git_rebase",
				"gitcommit",

				-- Build systems
				"cmake",
				"dockerfile",
			},
			highlight = {
				enable = true,
				use_languagetree = true,
			},

			indent = { enable = true },
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")

			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")
			local capabilities = cmp_nvim_lsp.default_capabilities()

			mason.setup({
				ensure_installed = {
					"lldb",
					"debugpy",
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
					"ts_ls",
					"lua_ls",
					"omnisharp",
					"svls",
				},
				handlers = vim.tbl_deep_extend("force", {
					function(server_name)
						lspconfig[server_name].setup({
							capabilities = capabilities
						})
					end
				}, {
						["clangd"] = function()
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
							lspconfig.omnisharp.setup({
								capabilities = capabilities,
								cmd = { "omnisharp" }
							})
						end,

						["jdtls"] = function()
						end,
					})
			})
		end,
	},
	{
		"tpope/vim-unimpaired",
		event = "BufReadPre"
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			fast_wrap = {},
			disable_filetype = { "TelescopePrompt", "vim" },
		},
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)
		end,
	},
	{
		"OXY2DEV/markview.nvim",
		ft = "markdown",

		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		}
	},
	{
		"fatih/vim-go",
		ft = "go",
	}
}
