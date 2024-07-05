return {
  "nvim-tree/nvim-tree.lua",
  requires = "kyazdani42/nvim-web-devicons",

  config = function()
    require("nvim-tree").setup({
      auto_close = true,
      update_focused_file = {
        enable = true,
      },
    })
    vim.g.nvim_tree_disable_netrw = 1         -- moved to lv-globals
    vim.g.nvim_tree_hijack_netrw = 1          --"1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
    vim.g.nvim_tree_hide_dotfiles = 1         -- 0 by default, this option hides files and folders starting with a dot `.`
    vim.g.nvim_tree_indent_markers = 1        -- "0 by default, this option shows indent markers when folders are open
    vim.g.nvim_tree_follow = 1                -- "0 by default, this option allows the cursor to be updated when entering a buffer
    vim.g.nvim_tree_auto_ignore_ft = "startify" --empty by default, don't auto open tree on specific filetypes.
    vim.g.nvim_tree_quit_on_open = 0          -- this doesn't play well with barbar
    vim.g.nvim_tree_icons = {
      default = "",
      symlink = "",
      git = { unstaged = "", staged = "✓", unmerged = "", renamed = "➜", untracked = "" },
      folder = { default = "", open = "", empty = "", empty_open = "", symlink = "" },
    }

    local _M = {}
    local is_open = false
    _M.toggle_tree = function()
      if is_open then
        is_open = false
        require("bufferline.state").set_offset(0)
      else
        is_open = true
        require("bufferline.state").set_offset(31, "File Explorer")
      end
      vim.cmd("NvimTreeToggle")
    end
    vim.keymap.set("n", "<C-n>", _M.toggle_tree, { noremap = true, silent = true })
  end,
}
