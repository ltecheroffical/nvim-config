local opt = vim.opt

-- Lines
opt.relativenumber = true
opt.number = true

-- Indentation
opt.expandtab = false
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.autoindent = true

-- Wrapping
opt.wrap = false

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Editing
opt.backspace = "indent,eol,start"

-- File explorer
vim.cmd("let g:netrw_liststyle = 3") -- Tree view

-- Clipboard
opt.clipboard:append("unnamedplus") -- System clipboard

-- Windows
opt.splitright = true
opt.splitbelow = true

-- Visual
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
