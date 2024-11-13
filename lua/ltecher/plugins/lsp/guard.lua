return {
    "nvimdev/guard.nvim",
    event = "BufReadPre",
    dependencies = {
        "nvimdev/guard-collection"
    },
    config = function()
        local ft = require("guard.filetype")

        ft("c,m,cpp,json"):fmt("clang-format")

        vim.g.guard_config = {
            fmt_on_save = true,
            lsp_as_default_formatter = false,
        }
    end
}
