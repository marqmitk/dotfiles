return {

{'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
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
