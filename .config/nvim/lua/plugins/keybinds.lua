return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 200

    local wk = require("which-key")

    mappings = {
      ["<leader>"] = {
        f = {
          name = "+Find",
          f = { "Find File" },
          r = { "Open Recent File" },
          g = { "Grep" },
          b = { "Buffers" },
          d = { "Jump to Definition" },
          u = { "Find References" },
        },

        g = {
          name = "+Git",
          g = { "<cmd>Telescope git_status<cr>", "Git Status" },
          b = { "<cmd>Telescope git_branches<cr>", "Checkout Branch" },
          c = { "<cmd>Telescope git_commits<cr>", "Checkout Commit" },
          s = { "<cmd>Telescope git_stash<cr>", "Stash" },
        },

        d = {
          name = "+Debug",
          t = { "Toggle Breakpoint" },
          o = { "Step Over" },
          i = { "Step Into" },
          s = { "Step Out" },
          c = { "Continue" },
        },

        b = {
          name = "+Bar",
          m = { "Next Tab" },
          n = { "Previous Tab" },
          ["1"] = { "Jump to Tab 1" },
          ["2"] = { "Jump to Tab 2" },
          ["3"] = { "Jump to Tab 3" },
          ["4"] = { "Jump to Tab 4" },
        },

        c = {
          name = "+Code",
          a = { "Code Action" },
          r = { "Rename symbol" },
        },

        o = {
          name = "+Open",
          o = { "Outline" },
          u = { "Undo Tree" },
        },
        s = {
          name = "+Split",
          v = { "Vertical Split" },
          s = { "Horizontal Split" },
        },
        h = {
          name = "+Harpoon",
          a = { "Add file harpoon list" },
          m = { "Open harpoon menu" },
        },
        p = {
          name = "+Preview",
          l = { "Start Latex Preview" },
        },
      },
    }

    wk.register(mappings, {})
  end,
}
