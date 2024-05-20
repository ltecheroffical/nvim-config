return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  config = function ()
    local dap = require('dap')
    local keymap = vim.keymap

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
