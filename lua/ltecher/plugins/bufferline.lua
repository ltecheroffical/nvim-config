return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function ()
        vim.opt.termguicolors = true
        require("bufferline").setup{}

        vim.keymap.set("n", "<Tab>", ":bnext<CR>", {silent = true})
        vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", {silent = true})
    end,
}
