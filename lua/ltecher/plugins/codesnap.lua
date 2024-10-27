return {
    "mistricky/codesnap.nvim",
    lazy = true,
    build = "make",
    cmd = {
        "CodeSnap",
        "CodeSnapSave",
        "CodeSnapASCII",
        "CodeSnapHighlight",
        "CodeSnapSaveHighlight",
    },
    opts = {
        title = "",
        has_line_number = true,


        bg_theme = "sea",
        watermark = ""
    },
    config = function(_, opts)
        require("codesnap").setup(opts)
    end
}
