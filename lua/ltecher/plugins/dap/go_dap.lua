return {
	"leoluz/nvim-dap-go",
	ft = "go",
	opts = {
		dap_configurations = {
			{
				type = "go",
				name = "Attach remote",
				mode = "remote",
				request = "attach",
			},
			{
				type = "go",
				name = "Debug",
				request = "launch",
				program = "${file}",
			},
			{
				type = "go",
				name = "Debug (Build Flags)",
				request = "launch",
				program = "${file}",
			},
			{
				type = "go",
				name = "Debug (Build Flags & Arguments)",
				request = "launch",
				program = "${file}",
			},
		},
		delve = {
			path = "dlv",
			initialize_timeout_sec = 20,
			port = "${port}",
			args = {},
			build_flags = {},
			detached = vim.fn.has("win32") == 0,
			cwd = nil,
		},
		tests = {
			verbose = false,
		}
	},
	config = function (_, opts)
		local dap_go = require("dap-go")

		for _, cfg in ipairs(opts.dap_configurations) do
		  if cfg.name:match("Build Flags") then
			cfg.buildFlags = dap_go.get_build_flags
		  end
		  if cfg.name:match("Arguments") then
			cfg.args = dap_go.get_arguments
		  end
		end
		dap_go.setup(opts)
	end,
}
