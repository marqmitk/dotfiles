return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ensure_installed = {
          "asmfmt",
          "beautysh",
          "black",
          "clang-format",
          "latexindent",
          "prettier",
          "shfmt",
          "stylua",
          "codelldb",
          "cpptools",
          "denols",
          "eslint",
          "shellcheck",
        },
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    depends = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
    opts = {
      handlers = {},
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "powershell_es",
          "bashls",
          "texlab",
          "clangd",
          "asm_lsp",
          "denols",
          "slint_lsp",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.powershell_es.setup({})
      lspconfig.bashls.setup({})
      lspconfig.texlab.setup({})
      lspconfig.clangd.setup({})
      lspconfig.asm_lsp.setup({})
      lspconfig.denols.setup({})
      lspconfig.slint_lsp.setup({})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>fd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>fD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "<leader>fi", vim.lsp.buf.implementation, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {})
    end,
  },
}
