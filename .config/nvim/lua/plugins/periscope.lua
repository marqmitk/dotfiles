return {
  "mlp1802/periscope.nvim",
  name = "periscope",
  dependencies = { "nvim-tree/nvim-tree.lua" },
  config = function()
    require("periscope").setup(true)
    require("nvim-tree").setup()
  end,
}
