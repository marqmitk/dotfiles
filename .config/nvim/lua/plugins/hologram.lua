local hologram = {
  'edluffy/hologram.nvim',
  config = function()
    require('hologram').setup({
    })
  end,
}

if not vim.g.neovide then
  hologram = {}
end

return {
  hologram,
}
