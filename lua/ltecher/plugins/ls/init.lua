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
				"rust",
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
			require("nvim-treesitter").setup(opts)
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
			local capabilities = cmp_nvim_lsp.default_capabilities()

			mason.setup({
				ensure_installed = {
					"lldb",
					"prettier",
					"debugpy",
					"gdtoolkit",
					"netcoredbg",
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
					"rust_analyzer",
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
					["rust_analyzer"] = function()
						lspconfig.rust_analyzer.setup({
							settings = {
								["rust-analyzer"] = {
									cargo = { allFeatures = true },
									checkOnSave = {
										command = "clippy" -- optional: run clippy on save
									},
									procMacro = { enable = true },
								}
							},
							root_markers = { { "Config.toml" }, ".git" },
						})
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
	},
	{
		'stevearc/conform.nvim',
		config = function(_, opts)
			require("conform").setup({
				formatters_by_ft = {
					javascript = { "prettier" },
					javascriptreact = { "prettier" },
					typescript = { "prettier" },
					typescriptreact = { "prettier" },

					html = { "prettier" },
					css = { "prettier" },
					scss = { "prettier" },
					less = { "prettier" },

					json = { "prettier" },
					jsonc = { "prettier" },
					yaml = { "prettier" },
					markdown = { "prettier" },
					graphql = { "prettier" },

					svelte = { "prettier" },
					vue = { "prettier" },
					astro = { "prettier" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
			})
		end,
	},
	{
		"Mathijs-Bakker/godotdev.nvim",
		dependencies = { 'nvim-lspconfig', 'nvim-dap', 'nvim-dap-ui', 'nvim-treesitter' },
		config = function()
			require("godotdev").setup({
				csharp = true,
				editor_host = "127.0.0.1",
				editor_port = 6005, -- Godot LSP port
				debug_port = 6006,
			})
		end
	},
	{
		"zenc-lang/zenc.vim",
	},
}
