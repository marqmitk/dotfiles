return {
  "nvim-neo-tree/neo-tree.nvim",
  config = function()
    local nonicons_extention = require("nvim-nonicons.extentions.nvim-tree")

    require("neo-tree").setup({
      close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
      open_files_in_last_window = false,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      window = {
        mappings = {
          ["<space>"] = {
            "toggle_node",
            nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
          },
          ["ga"]      = "git_add_file",
          ["gr"]      = "git_revert_file",
        }
      },
      filesystem = {
        hijack_netrw_behavior = "open_current"
      },
      renderer = {
        icons = {
          glyphs = nonicons_extention.glyphs,
        },
      },
    })
    vim.keymap.set("n", "<C-n>", "<cmd>Neotree float toggle<CR>", { silent = true })
  end,
}
