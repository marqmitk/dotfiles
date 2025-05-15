-- In your plugins setup file (e.g., plugins/tools.lua or similar)
return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" }, -- Optional: Run formatter before saving
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier", "eslint_d" },
        typescript = { "prettier", "eslint_d" },
        javascriptreact = { "prettier", "eslint_d" },
        typescriptreact = { "prettier", "eslint_d" },
        python = { "black" }, -- You can add "isort" here too: {"isort", "black"}
        sh = { "beautysh" },
        bash = { "beautysh" }, -- Add alias for bash
        zsh = { "beautysh" }, -- Add alias for zsh
        asm = { "asmfmt" }, -- Assuming 'asm' is the filetype for your assembly files

        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        ["*"] = { "prettier" }, -- Example: use prettier for any other filetype
      },

      -- Optional: Configure format on save
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true, -- Fallback to LSP formatting if conform.nvim fails
      },

      -- Optional: customize formatters
      formatters = {
        stylua = {
          prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" }, -- Example customization
        },
        prettier = {},
        eslint_d = {
          args = { "--fix" }, -- Ensure it fixes
        },
        black = {},
        beautysh = {},
        asmfmt = {},
      },
    },
    keys = {
      {
        "<C-l>",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "n",
        desc = "Format buffer",
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" }, -- Adjust event as needed, e.g. "VeryLazy"
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("LintingGroup", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          if pcall(require, "lint") then
            require("lint").try_lint()
          end
        end,
      })
    end,
  },
}
