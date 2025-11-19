-- Adapted version of my GPT-5 to GPT-4o prompt
local SYSTEM_PROMPT = [[Use the response models of the following. The TLDR in the end, the bullet style responses, the more friendly tone. less professional, more casual but still keeping the facts and info professional, and emojis everywhere including bulletpoints and headers, were all things to use.

Talk like a member of Gen Z. Adopt a skeptical, questioning approach.

Longer responses preferred. You can have opinions and don't need to agree with me on everything. If I'm off base and you know better, you can convince me.  A larger vocabulary is fine. Snarky and witty and forward thinking. Don't just tell me what I want to hear, tell me what I need to hear. Stop using Reflective Reframing or Transformational Framing that’s usually put at the end of responses, and questions aren't a necessary part of every interaction.]]

return {
	"huynle/ogpt.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>cc",
			"<cmd>OGPT<CR>",
			desc = "Chat",
		},
		{
			"<leader>cf",
			"<cmd>OGPTFocus<CR>",
			desc = "Chat",
		},
		{
			"<leader>cr",
			"<cmd>OGPTRun<CR>",
			desc = "Run action",
			mode = {"n", "v"},
		},
		{
			"<leader>cec",
			"<cmd>OGPTRun edit_code_with_instructions<CR>",
			desc = "Edit code",
			mode = {"n", "v"},
		},
		{
			"<leader>cet",
			"<cmd>OGPTRun edit_with_instructions<CR>",
			desc = "Edit text",
			mode = {"n", "v"},
		},
		{
			"<leader>c?",
			"<cmd>OGPTRun quick_question<CR>",
			desc = "Quick question",
		},
	},
	opts = {
		default_provider = "ollama",
		edgy = true,
		single_window = false,
		providers = {
			ollama = {
				api_host = os.getenv("OLLAMA_API_HOST") or "http://localhost:11434",
				api_key = os.getenv("OLLAMA_API_KEY") or "",
				model = "qwen3:4b",
				models = {
					coder = "phi:2.7b",
				},
			},
		},
		edit = {
			edgy = nil, -- use global default, override if defined
			diff = false,
			keymaps = {
				close = "<C-c>",
				accept = "<M-CR>",
				toggle_diff = "<C-d>",
				toggle_parameters = "<C-o>",
				cycle_windows = "<Tab>",
				use_output_as_input = "<C-u>",
			},
		},
		popup = {
			edgy = nil, -- use global default, override if defined
			position = 1,
			size = {
				width = "40%",
				height = 10,
			},
			padding = { 1, 1, 1, 1 },
			enter = true,
			focusable = true,
			zindex = 50,
			border = {
				style = "rounded",
			},
			buf_options = {
				modifiable = false,
				readonly = false,
				filetype = "ogpt-popup",
				syntax = "markdown",
			},
			win_options = {
				wrap = true,
				linebreak = true,
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
			},
			keymaps = {
				close = { "<C-c>", "q" },
				accept = "<C-CR>",
				append = "a",
				prepend = "p",
				yank_code = "c",
				yank_to_register = "y",
			},
		},
		chat = {
			edgy = nil, -- use global default, override if defined
			welcome_message = "Welcome!",
			loading_text = "Loading, please wait ...",
			question_sign = "", -- 🙂
			answer_sign = "ﮧ", -- 🤖
			border_left_sign = "|",
			border_right_sign = "|",
			max_line_length = 120,
			sessions_window = {
				active_sign = " 󰄵 ",
				inactive_sign = " 󰄱 ",
				current_line_sign = "",
				border = {
					style = "rounded",
					text = {
						top = " Sessions ",
					},
				},
				win_options = {
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
				},
			},
			keymaps = {
				close = { "<C-c>" },
				yank_last = "<C-y>",
				yank_last_code = "<C-i>",
				scroll_up = "<C-u>",
				scroll_down = "<C-d>",
				new_session = "<C-n>",
				cycle_windows = "<Tab>",
				cycle_modes = "<C-f>",
				next_message = "J",
				prev_message = "K",
				select_session = "<CR>",
				rename_session = "r",
				delete_session = "d",
				draft_message = "<C-d>",
				edit_message = "e",
				delete_message = "d",
				toggle_parameters = "<C-o>",
				toggle_message_role = "<C-r>",
				toggle_system_role_open = "<C-s>",
				stop_generating = "<C-x>",
			},
		},
		actions = {
			grammar_correction = {
				type = "popup",
				template = "Correct the given text to standard {{{lang}}}:\n\n```{{{input}}}```",
				system = "You are a helpful note writing assistant, given a text input, correct the text only for grammar and spelling error. You are to keep all formatting the same, e.g. markdown bullets, should stay as a markdown bullet in the result, and indents should stay the same. Return ONLY the corrected text. " .. SYSTEM_PROMPT,
				strategy = "replace",
				params = {
					temperature = 0.3,
				},
				args = {
					lang = {
						type = "string",
						optional = "true",
						default = "english",
					},
				},
			},
			do_complete_code = {
				type = "popup",
				template = "Code:\n```{{{filetype}}}\n{{{input}}}\n```\n\nCompleted Code:\n```{{{filetype}}}",
				strategy = "display",
				params = {
					model = "coder",
					stop = {
						"```",
					},
				},
			},

			quick_question = {
				type = "popup",
				args = {
					-- template expansion
					question = {
						type = "string",
						optional = "true",
						default = function()
							return vim.fn.input("Question: ")
						end,
					},
				},
				system = SYSTEM_PROMPT,
				template = "{{{question}}}",
				strategy = "display",
			},

			custom_input = {
				type = "popup",
				args = {
					instruction = {
						type = "string",
						optional = "true",
						default = function()
							return vim.fn.input("Instruction: ")
						end,
					},
				},
				system = SYSTEM_PROMPT,
				template = "Given the follow snippet, {{{instruction}}}.\n\nsnippet:\n```{{{filetype}}}\n{{{input}}}\n```",
				strategy = "display",
			},

			optimize_code = {
				type = "popup",
				system = "You are a helpful coding assistant. " .. SYSTEM_PROMPT .. " Complete the given prompt.",
				template = "Optimize the code below, following these instructions:\n\n{{{instruction}}}.\n\nCode:\n```{{{filetype}}}\n{{{input}}}\n```\n\nOptimized version:\n```{{{filetype}}}",
				strategy = "edit_code",
				params = {
					model = "coder",
					stop = {
						"```",
					},
				},
			},
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		{
			"folke/edgy.nvim",
			event = "VeryLazy",
			init = function()
				vim.opt.laststatus = 3
				vim.opt.splitkeep = "screen" -- or "topline" or "screen"
			end,
			opts = {
				exit_when_last = false,
				animate = {
					enabled = false,
				},
				wo = {
					winbar = true,
					winfixwidth = true,
					winfixheight = false,
					winhighlight = "WinBar:EdgyWinBar,Normal:EdgyNormal",
					spell = false,
					signcolumn = "no",
				},
				keys = {
					-- -- close window
					["q"] = function(win)
						win:close()
					end,
					-- close sidebar
					["Q"] = function(win)
						win.view.edgebar:close()
					end,
					-- increase width
					["<S-Right>"] = function(win)
						win:resize("width", 3)
					end,
					-- decrease width
					["<S-Left>"] = function(win)
						win:resize("width", -3)
					end,
					-- increase height
					["<S-Up>"] = function(win)
						win:resize("height", 3)
					end,
					-- decrease height
					["<S-Down>"] = function(win)
						win:resize("height", -3)
					end,
				},
				right = {
					{
						title = "OGPT Popup",
						ft = "ogpt-popup",
						size = { width = 0.2 },
						wo = {
							wrap = true,
						},
					},
					{
						title = "OGPT Parameters",
						ft = "ogpt-parameters-window",
						size = { height = 6 },
						wo = {
							wrap = true,
						},
					},
					{
						title = "OGPT Template",
						ft = "ogpt-template",
						size = { height = 6 },
					},
					{
						title = "OGPT Sessions",
						ft = "ogpt-sessions",
						size = { height = 6 },
						wo = {
							wrap = true,
						},
					},
					{
						title = "OGPT System Input",
						ft = "ogpt-system-window",
						size = { height = 6 },
					},
					{
						title = "OGPT",
						ft = "ogpt-window",
						size = { height = 0.5 },
						wo = {
							wrap = true,
						},
					},
					{
						title = "OGPT {{{selection}}}",
						ft = "ogpt-selection",
						size = { width = 80, height = 4 },
						wo = {
							wrap = true,
						},
					},
					{
						title = "OGPt {{{instruction}}}",
						ft = "ogpt-instruction",
						size = { width = 80, height = 4 },
						wo = {
							wrap = true,
						},
					},
					{
						title = "OGPT Chat",
						ft = "ogpt-input",
						size = { width = 80, height = 4 },
						wo = {
							wrap = true,
						},
					},
				},
			},
		},
	},
}
