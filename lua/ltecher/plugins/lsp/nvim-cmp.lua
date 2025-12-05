return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		{
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
			build = "make install_jsregexp",
			keys = {
				-- Jump to next placeholder / expand snippet
				{
					"<Tab>",
					function()
						local luasnip = require("luasnip")
						if luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							return "<Tab>"
						end
					end,
					mode = {"i", "s"},
					expr = true,
					silent = true,
				},
				-- Jump to previous placeholder
				{
					"<S-Tab>",
					function()
						local luasnip = require("luasnip")
						if luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							return "<S-Tab>"
						end
					end,
					mode = {"i", "s"},
					expr = true,
					silent = true,
				},
				-- Cycle choice nodes
				{
					"<C-l>",
					function()
						local luasnip = require("luasnip")
						if luasnip.choice_active() then
							luasnip.change_choice(1)
						end
					end,
					mode = {"i", "s"},
					silent = true,
				},
			},
		},
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},
	config = function()
		local cmp = require("cmp")

		local luasnip = require("luasnip")

		local lspkind = require("lspkind")

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_lua").lazy_load({
			paths = vim.fn.expand("~/.config/nvim/LuaSnip/snippets")
		})
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<CR>'] = cmp.mapping.confirm({ select = true }),
				['<C-e>'] = cmp.mapping.abort(),
				['<Up>'] = cmp.mapping.select_prev_item(),
				['<Down>'] = cmp.mapping.select_next_item(),
			}),
			-- sources for autocompletion

			sources = cmp.config.sources({
				{ name = "nvim_lsp"},
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
				{ name = "minuet" }, -- minuet ai
			}),

			-- configure lspkind for vs-code like pictograms in completion menu
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol",
					maxwidth = 50,
					ellipsis_char = "...",
					symbol_map = { Codeium = "" }
				}),
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			}
		})
	end,
}
