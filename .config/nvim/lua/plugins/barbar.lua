return {

{'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {},
    config = function()
      vim.g.barbar_auto_setup = false
      vim.keymap.set('n', '<leader>b1', '<cmd>BufferGoto 1<CR>')
      vim.keymap.set('n', '<leader>b2', '<cmd>BufferGoto 2<CR>')
      vim.keymap.set('n', '<leader>b3', '<cmd>BufferGoto 3<CR>')
      vim.keymap.set('n', '<leader>b4', '<cmd>BufferGoto 4<CR>')
      vim.keymap.set('n', '<leader>bm', '<cmd>BufferNext<CR>')
      vim.keymap.set('n', '<leader>bn', '<cmd>BufferPrevious<CR>')
      vim.keymap.set('n', '<leader>bd', '<cmd>BufferClose<CR>')
      vim.keymap.set('n', '<leader>bb', '<cmd>enew<CR>')
    end,
  }
}
