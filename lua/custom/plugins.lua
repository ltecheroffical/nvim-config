local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Languauge Servers 
        "clangd",
        "pyright",
        "gopls",
        "cmake-language-server",
        "typescript-language-server",
        "lua-language-server",
        "htmx-lsp",

        -- Linting
        "sonarlint-language-server",

        -- Debuggers
        "codelldb",
        "debugpy"
      }
    }
  },
  -- LSP Server
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "OmniSharp/omnisharp-vim",
    event = "BufEnter",
  },
  -- Debugger
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    config = function(_, _)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
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
  -- Codeium
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    config = function()
      vim.g.codeium_disable_bindings = 1

      -- Make sure Codeium is in manual mode
      vim.g.codeium_manual = 1

      -- Disable for specific filetypes
      vim.g.codeium_filetypes = {
        text = false,
      }
    end,
  },
  -- Async
  {
    "nvim-neotest/nvim-nio",
    lazy = false,
  },
  -- Tmux
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  -- Git
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    config = function()
      require("core.utils").load_mappings("git")
    end,
  }
}

return plugins
