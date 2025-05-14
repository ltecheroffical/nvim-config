local user_config = require("config")
local default_config = {
    misc = {
        enable_quickmath = false,
    },

    telescope_ignore_patterns = {
        "node_modules",

        "thirdparty"
    },

    lsp_servers = {},
    lsp_functions = {
    },
    debuggers = {
        "lldb"
    },

    plugins = {
    },

    extra_lualine_sections = {
    },

    keymaps = {
        exit_insert_alt = "jk",
        clear_search = "<leader>nh",
        save_file = "<C-s>",

        -- Numbers
        add_number = "<leader>+",
        subtract_number = "<leader>-",

        -- Terminal
        exit_terminal_mode = "<A-x>",

        -- Line movement
        move_line_up = "<A-Up>",
        move_line_down = "<A-Down>",

        lsp = {
            show_references = "<leader>gr",
            show_declaration = "<leader>gD",
            show_definitions = "<leader>gd",
            show_implementations = "<leader>gi",
            show_type_definitions = "<leader>gt",
            show_code_actions = "<leader>ca",
            smart_rename = "<leader>rn",
            show_diagnostics = "<leader>D",
            show_diagnostics_line = "<leader>gd",
            prev_diagnostic = "[<leader>g",
            next_diagnostic = "]<leader>g",
            show_documentation = "K",
            restart_lsp = "<leader>gs"
        }
    }
}

return vim.tbl_deep_extend("force", default_config, user_config)
