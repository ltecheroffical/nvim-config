return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		piority = 1000,
		config = function()
			vim.cmd.colorscheme "catppuccin-mocha"
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local lualine = require("lualine")
			local lazy_status = require("lazy.status") -- to configure lazy pending updates count


			-- configure lualine with modified theme
			lualine.setup({
				sections = {
					lualine_x = {
						{
							lazy_status.updates,
							cond = lazy_status.has_updates,
							color = { fg = "#ff9e64" },
						},
						{ "encoding" },
						{ "fileformat" },
						{ "filetype" },
					}
				}
			})
		end,
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy"
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
		opts = {}
	},
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local todo_comments = require("todo-comments")

			todo_comments.setup()
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			vim.opt.termguicolors = true

			vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

			require("nvim-tree").setup({
				sort = {
					sorter = "case_sensitive",
				},
				view = {
					width = 30,
				},
				renderer = {
					group_empty = true,
				},
				git = {
					enable = true,
					ignore = false,
					timeout = 400,
				},
				sync_root_with_cwd = true,
			})
		end,
	},
}
