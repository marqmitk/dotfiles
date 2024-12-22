-- function that triggers NoNeckPain and then calls NoNeckPainWidthUp 5 times
return {
  "shortcuts/no-neck-pain.nvim",
  config = function()
    local opts = {
      buffers = {
        scratchPad = {
          -- set to `false` to
          -- disable auto-saving
          enabled = true,
          -- set to `nil` to default
          -- to current working directory
          location = "~/Documents/",
        },
        bo = {
          filetype = "md",
        },
      },
      width = 250,
    }

    require("no-neck-pain").setup(opts)
    vim.api.nvim_set_keymap("n", "<leader>on", "<cmd>NoNeckPain<CR>", { noremap = true, silent = true })
  end,
}
