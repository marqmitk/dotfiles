local onedark = {
  'navarasu/onedark.nvim',
  config = function()
    vim.g.onedark_style = 'darker'
    vim.cmd('colorscheme onedark')
  end
}

return {
  onedark
}
