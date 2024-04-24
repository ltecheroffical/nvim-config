local M = {}

-- Disabled
M.disabled = {
  n = {
    ["<leader>gt"] = "",
    ["<leader>gb"] = "",
  }
}

-- Tmux
M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft <CR>", "Tmux Navigate Left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight <CR>", "Tmux Navigate Right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown <CR>", "Tmux Navigate Down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp <CR>", "Tmux Navigate Up" },
  }
}

-- DAP
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

M.lspconfig = {
  plugin = true,
  n = {
    ["<leader>gD"] = {
      "<cmd>lua vim.lsp.buf.declaration()<CR>",
      "Go to declaration",
    },
    ["<leader>gd"] = {
      "<cmd>lua vim.lsp.buf.definition()<CR>",
      "Go to definition",
    }
  }
}

-- Git
M.git = {
  n = {
    ["<leader>gg"] = {
      function()
        vim.ui.input({ prompt = "git " }, function(input)
          vim.cmd("Git " .. input)
        end)
      end,
      "Git",
    },
    ["<leader>gs"] = {
      "<cmd> Git status <CR>",
      "Git status",
    },
    ["<leader>gl"] = {
      "<cmd> Git log <CR>",
      "Git log",
    },
    ["<leader>gb"] = {
      "<cmd> Git blame <CR>",
      "Git blame",
    },
    ["<leader>gc"] = {
      function()
        vim.ui.input({ prompt = "Commit message: " }, function(input)
          vim.cmd("Git add -A")
          vim.cmd("Git commit -m \"" .. input .. "\"")
        end)
      end,
      "Git commit",
    },
    ["<leader>gp"] = {
      "<cmd> Git push <CR>",
      "Git push",
    },
  }
}

-- Project
M.project = {
  n = {
    ["<S-C-b>"] = {
      ":!sh build_project.sh<CR>",
      "Build Project",
    },
    ["<F5>"] = {
      ":!sh run_project.sh<CR>",
      "Run Project",
    }
  }
}

-- NvChad
M.nvchad = {
  n = {
    ["<leader>rc"] = {
      ":luafile ~/.config/nvim/init.lua<CR>",
      "Reload config",
    },
  }
}

-- Move Lines
vim.api.nvim_set_keymap("n", "<A-Down>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-Up>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-Up>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-Down>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Codeium
vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
vim.keymap.set('i', '<c-space>', function() return vim.fn['codeium#Complete']() end, { expr = true, silent = true })

return M
