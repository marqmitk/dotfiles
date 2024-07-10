return {
  "vonheikemen/fine-cmdline.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("fine-cmdline").setup({
      cmdline = {
        prompt = " ",

      },
      popup = {
        position = {
          row = "30%",
          col = "50%",
        },
      },
    })
    -- make highlight group have nobg
    vim.cmd [[
      hi link FineCmdlineNormal Normal
      hi link FineCmdlinePrompt Normal
      hi link FineCmdlinePopup Normal
      hi link FineCmdlinePopupBorder Normal
    ]]
  end,
}
