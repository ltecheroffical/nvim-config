return {
    'Exafunction/codeium.vim',
    event = "InsertEnter",
    cmd = { "Codeium", "CodeiumAuto", "CodeiumDisable", "CodeiumEnable", "CodeiumManual", "CodeiumToggle" },
    -- This function fixes a bug in Codeium that stops the right arrow key from being used
    init = function()
        -- See: https://github.com/Exafunction/codeium.vim
        vim.g.codeium_disable_bindings = 1
   end,
    config = function()
        -- Make sure Codeium is in manual mode
        vim.g.codeium_manual = 1

        -- Disable for specific filetypes
        vim.g.codeium_filetypes = {
            text = false,
        }

        local keymap = vim.keymap

        keymap.set("n", "<C-o>", function() return vim.fn['codeium#Chat']() end, { expr = true, silent = true })
        keymap.set("i", "<C-g>", function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
        keymap.set("i", "<C-;>", function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
        keymap.set("i", "<C-,>", function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
        keymap.set("i", "<C-x>", function() return vim.fn['codeium#Complete']() end, { expr = true, silent = true })
    end,
}
