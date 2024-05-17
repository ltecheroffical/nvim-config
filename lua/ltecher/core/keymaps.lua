vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" })

-- Numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Tabs
keymap.set("n", "<leader>x", ":bdelete<CR>", { desc = "Close tab" })

-- Line movement
keymap.set("i", "<A-Down>", "<ESC>:m .+1<CR>==gi", { desc = "Move line down" })
keymap.set("i", "<A-Up>", "<ESC>:m .-2<CR>==gi", { desc = "Move line up" })
keymap.set("n", "<A-Down>", ":m .+1<CR>==", { desc = "Move line down" })
keymap.set("n", "<A-Up>", ":m .-2<CR>==", { desc = "Move line up" })

-- Tree
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file explorer" })
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })

-- Codeium
keymap.set("n", "<C-o>", function() return vim.fn['codeium#Chat']() end, { expr = true, silent = true })
keymap.set("i", "<C-g>", function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
keymap.set("i", "<C-;>", function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
keymap.set("i", "<C-,>", function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
keymap.set("i", "<C-x>", function() return vim.fn['codeium#Complete']() end, { expr = true, silent = true })


