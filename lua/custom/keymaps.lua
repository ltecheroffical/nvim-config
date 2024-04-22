local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft <CR>", "Tmux Navigate Left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight <CR>", "Tmux Navigate Right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown <CR>", "Tmux Navigate Down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp <CR>", "Tmux Navigate Up" },
  }
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    }
  }
}


-- Terminal Build and Run
vim.api.nvim_set_keymap('n', '<S-C-b>', [[:!sh build_project.sh<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-b>', [[:split term://sh build_project.sh<CR>]], { noremap = true, silent = true })

-- Codeium Config
vim.api.nvim_set_keymap('n', '<F5>', [[:!sh run_project.sh<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-C-r>', [[:split term://sh run_project.sh<CR>]], { noremap = true, silent = true })


-- Move Lines
vim.api.nvim_set_keymap("n", "<A-Down>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-Up>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-Up>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-Down>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Codeium
vim.g.codeium_disable_bindings = 1
vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
vim.keymap.set('n', '<c-o>', function() return vim.fn['codeium#Chat']() end, { expr = true, silent = true })
vim.keymap.set('i', '<c-space>', function() return vim.fn['codeium#Complete']() end, { expr = true, silent = true })

return M
