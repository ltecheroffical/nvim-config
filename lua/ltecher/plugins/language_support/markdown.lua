return {
    "toppair/peek.nvim",
    event = "VeryLazy",
    build = "deno task --quiet build:fast",
    opts = {
        auto_load = false,
        close_on_bdelete = true,
        syntax = true,
        theme = 'dark',
        update_on_change = true,
        app = 'webview',
        filetype = { 'markdown' },
        throttle_at = 200000,
        throttle_time = 'auto',
    },
    config = function(opts)
        require("peek").setup(opts)
        vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
        vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end
}
