local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { import = "ltecher.plugins" },
    { import = "ltecher.plugins.visual" },

    { import = "ltecher.plugins.lsp" },
    { import = "ltecher.plugins.dap" },
    { import = "ltecher.plugins.language_support" },

    { import = "ltecher.plugins.git" }
  }, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
