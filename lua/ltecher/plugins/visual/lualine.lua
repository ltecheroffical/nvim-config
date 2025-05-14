return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status") -- to configure lazy pending updates count


        -- configure lualine with modified theme
        lualine.setup({
            sections = {
                lualine_x = {
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = "#ff9e64" },
                    },
                    { "encoding" },
                    { "fileformat" },
                    { "filetype" },
                    {
                        function()
                            local status = require("ollama").status()

                            if status == "IDLE" then
                                return "󱙺" -- nf-md-robot-outline
                            elseif status == "WORKING" then
                                return "󰚩" -- nf-md-robot
                            end
                        end,
                        cond = function()
                            return package.loaded["ollama"] and require("ollama").status() ~= nil
                        end,
                    }
                }
            }
        })
    end,
}
