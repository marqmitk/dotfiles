return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({})
    vim.api.nvim_set_keymap("n", "<leader>tt", ":ToggleTerm size=20 direction=float name=Terminal<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("t", "<C-\\>", "<C-\\><C-n>:ToggleTerm<CR>", { noremap = true, silent = true })
  end,
}
