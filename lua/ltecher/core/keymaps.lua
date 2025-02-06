local config = require("ltecher.core.config")

vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", config.keymaps.exit_insert_alt, "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", config.keymaps.clear_search, ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", config.keymaps.save_file, ":w<CR>", { desc = "Save file" })

-- Numbers
keymap.set("n", config.keymaps.add_number, "<C-a>", { desc = "Increment number" })
keymap.set("n", config.keymaps.subtract_number, "<C-x>", { desc = "Decrement number" })

-- Terminal
keymap.set("t", config.keymaps.exit_terminal_mode, "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Line movement
keymap.set("i", config.keymaps.move_line_down, "<ESC>:m .+1<CR>==gi", { desc = "Move line down", silent = true })
keymap.set("i", config.keymaps.move_line_up, "<ESC>:m .-2<CR>==gi", { desc = "Move line up", silent = true })
keymap.set("n", config.keymaps.move_line_down, ":m .+1<CR>==", { desc = "Move line down", silent = true })
keymap.set("n", config.keymaps.move_line_up, ":m .-2<CR>==", { desc = "Move line up", silent = true })

-- Netrw
keymap.set("n", config.keymaps.open_netrw_current_file, ":Explore %:p:h<CR>",
    { desc = "Open Netrw in the current file's directory", silent = true })
keymap.set("n", config.keymaps.open_netrw_cwd, ":Explore<CR>", { desc = "Open Netrw in the CWD", silent = true })
