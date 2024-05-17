return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  config = function ()
    local dap = require('dap')
    local keymap = vim.keymap

    local sourceFileMap = {}

    -- Read from it
    local file = io.open(vim.fn.getcwd() .. "/dap_source_map.txt", "r")
    if file then
      -- Read the lines
      for line in file:lines() do
        -- Replace "${cwd}" with the cwd
        line = line:gsub("${cwd}", vim.fn.getcwd())

        -- Split between :
        local split = vim.split(line, ":")
        -- Get the frst part as src and the second as dest
        sourceFileMap[split[1]] = split[2]
      end
    end

    dap.configurations.cpp = {
      {
        name = "Project: Launch",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
        sourceLanguages = { "cpp" },
        sourceFileMap = sourceFileMap
      }
    }

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
}
