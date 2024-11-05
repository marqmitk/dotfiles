return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim", "sharkdp/fd" },
    config = function()
      local builtin = require("telescope.builtin")
      local telescope = require("telescope")

      telescope.setup({})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {})
      vim.keymap.set("n", "<leader>fn", "<cmd>:Telescope notify<cr>", {})
      vim.keymap.set("n", "<leader>fu", "<cmd>:Telescope lsp_references<cr>", {})
      vim.keymap.set("n", "<leader>fe", "<cmd>:Telescope lsp_document_symbols<cr>", {})
      vim.keymap.set("n", "<leader>ft", "<cmd>:TodoTelescope keywords=TODO,FIX,HACK<cr>", {})
      --Telescope extensions
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      local icons = require("nvim-nonicons")
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_cursor({}),
          },
        },
        defaults = {
          prompt_prefix = "  " .. icons.get("telescope") .. "  ",
          selection_caret = " ❯ ",
          entry_prefix = "   ",
        },

      })
      require("telescope").load_extension("ui-select")
    end,
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require("telescope").load_extension("frecency")
    end,
  },
  {
    "airblade/vim-rooter",
    config = function()
      vim.g.rooter_silent_chdir = 1
      vim.g.rooter_patterns = { ".git", ".git/", ".gitignore", ".gitmodules", ".hg", ".hg/", ".hgignore", ".bzr", ".bzr/",
        ".bzrignore", ".svn", ".svn/", ".svnignore", ".project", ".project/", ".projectignore", ".idea", ".idea/",
        ".ideignore" }
      vim.g.rooter_manual_only = 1
      vim.keymap.set("n", "<leader>cd", "<cmd>:Rooter<cr>", {})
    end
  },

}
