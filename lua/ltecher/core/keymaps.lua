vim.g.mapleader = " "
vim.g.last_compile_command = ""

local function run_compile_command()
	local command = vim.fn.input({
		prompt = "Compile command: ",
		default = vim.g.last_compile_command,
		completion = "command",
	})

	if command == "" then
		return
	end

	vim.g.last_compile_command = command

	vim.cmd.terminal(command)
	vim.cmd.startinsert()
end

local function delete_keep_window()
	vim.cmd.stopinsert()

	local buf = vim.api.nvim_get_current_buf()
	local win = vim.api.nvim_get_current_win()
	local alt = vim.fn.bufnr("#")

	if alt > 0 and vim.api.nvim_buf_is_valid(alt) and alt ~= buf then
		vim.api.nvim_win_set_buf(win, alt)
	else
		vim.api.nvim_win_set_buf(win, vim.api.nvim_create_buf(true, false))
	end

	vim.api.nvim_buf_delete(buf, { force = true })
end

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" })

-- Numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Terminal
keymap.set("t", "<A-x>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.api.nvim_create_autocmd("TermClose", {
	callback = function(args)
		local buf = args.buf

		vim.schedule(function()
			if not vim.api.nvim_buf_is_valid(buf) then
				return
			end

			vim.cmd("stopinsert")

			vim.api.nvim_buf_set_keymap(buf, "n", "q", "", {
				noremap = true,
				silent = true,
				nowait = true,
				callback = delete_keep_window
			})

			vim.api.nvim_buf_set_keymap(
				buf,
				"t",
				"q",
				"",
				{
					noremap = true,
					silent = true,
					nowait = true,
					callback = delete_keep_window,
				}
			)
		end)
	end,
})
keymap.set("n", "<leader>cc", run_compile_command, { desc = "Run compile command" })

-- Line movement
keymap.set("i", "<A-Down>", "<ESC>:m .+1<CR>==gi", { desc = "Move line down", silent = true })
keymap.set("i", "<A-Up>", "<ESC>:m .-2<CR>==gi", { desc = "Move line up", silent = true })
keymap.set("n", "<A-Down>", ":m .+1<CR>==", { desc = "Move line down", silent = true })
keymap.set("n", "<A-Up>", ":m .-2<CR>==", { desc = "Move line up", silent = true })
