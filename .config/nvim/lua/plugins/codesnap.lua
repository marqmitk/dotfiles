return {
  {
    "mistricky/codesnap.nvim",
    build = "make",
    config = function()
      require('codesnap').setup({
        mac_window_bar=true,
        opacity=true,
        watermark="Codesnap",
        highlight_theme="rainbow",
        })
      vim.api.nvim_set_keymap('n', '<leader>os', ':CodeSnapPreviewOn<CR>', { noremap = true, silent = true })
    end
  },
}
