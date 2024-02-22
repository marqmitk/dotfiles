return {
  "xuhdev/vim-latex-live-preview",
  config=function ()
    -- create a keybind for :LLPStartPreview on the button <leader>pl
    vim.api.nvim_set_keymap("n", "<leader>pl", ":LLPStartPreview<CR>", { noremap = true, silent = true })
  end
}
