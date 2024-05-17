return {
  'Exafunction/codeium.vim',
  event = 'BufEnter',
  config = function()
    vim.g.codeium_disable_bindings = 1

    -- Make sure Codeium is in manual mode
    vim.g.codeium_manual = 1

    -- Disable for specific filetypes
    vim.g.codeium_filetypes = {
      text = false,
    }
  end,
}
