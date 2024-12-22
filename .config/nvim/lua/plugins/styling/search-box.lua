return {
  'VonHeikemen/searchbox.nvim',
  dependencies = { 'MunifTanjim/nui.nvim' },
  config = function ()
    vim.keymap.set('n', '<BSlash>', ':SearchBoxIncSearch<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<C-BSlash>', ':SearchBoxReplace confirm=menu<CR>', { noremap = true, silent = true })
  end
}
