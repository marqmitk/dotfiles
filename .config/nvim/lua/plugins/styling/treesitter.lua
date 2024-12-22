return {
  {
    "nvim-treesitter/nvim-treesitter",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({
        max_lines = 1,
        trim_scope = "inner",
      })
    end,
  },
  {
    "neovim/tree-sitter-vimdoc",
  },
}
