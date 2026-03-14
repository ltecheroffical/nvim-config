return {
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
			ensure_installed = {
				"codelldb"
			}
		}
	},
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		config = function ()
			local keymap = vim.keymap

			keymap.set("n", "<leader>dbb", function()
				require("dap").toggle_breakpoint()
			end,
				{ desc = "Debug Breakpoint" }
			)

			keymap.set("n", "<leader>dbc", function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
				{ desc = "Add condition breakpoint" }
			)

			keymap.set("n", "<leader>dbl", function()
				require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end,
				{ desc = "Add log point" }
			)

			keymap.set("n", "<leader>dr", "<cmd>DapContinue<CR>", { desc = "Debug Continue" })
		end
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function ()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
}
