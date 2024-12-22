local set_highlight_groups = function()
  vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
  vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE", ctermbg = "NONE" })
  vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE", ctermbg = "NONE" })
  vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { bg = "NONE", ctermbg = "NONE" })
end

local onedark = {
  "navarasu/onedark.nvim",
  config = function()
    vim.g.onedark_style = "darker"
    vim.cmd("colorscheme onedark")
    set_highlight_groups()
  end,
}

local tokyonight = {
  "folke/tokyonight.nvim",
  config = function()
    local opts = {
      style = "night",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      dim_inactive = true,
    }
    require("tokyonight").setup(opts)
    vim.cmd("colorscheme tokyonight")
  end,
}

return {
  tokyonight,
}
