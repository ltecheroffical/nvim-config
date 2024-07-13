vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" })

-- Numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Terminal
keymap.set("t", "<A-x>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Line movement
keymap.set("i", "<A-Down>", "<ESC>:m .+1<CR>==gi", { desc = "Move line down", silent = true })
keymap.set("i", "<A-Up>", "<ESC>:m .-2<CR>==gi", { desc = "Move line up", silent = true })
keymap.set("n", "<A-Down>", ":m .+1<CR>==", { desc = "Move line down", silent = true })
keymap.set("n", "<A-Up>", ":m .-2<CR>==", { desc = "Move line up", silent = true })

-- Tree
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file explorer" })
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
