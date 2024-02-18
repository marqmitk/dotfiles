return {
  'simrat39/symbols-outline.nvim',
  config = function()
    require('symbols-outline').setup {
      highlight_hovered_item = true,
      show_guides = true,
      width = 35,
      auto_preview = true,
      position = 'right',
      keymaps = {
        close = "<Esc>",
        goto_location = "<CR>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        rename_symbol = "r",
        code_actions = "a",
      },
      lsp_blacklist = {},
    }
    vim.api.nvim_set_keymap('n', '<leader>oo', '<cmd>SymbolsOutline<CR>', { noremap = true, silent = true })
  end,
}
