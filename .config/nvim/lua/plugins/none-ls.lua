return {
  'jose-elias-alvarez/null-ls.nvim',

  config = function()
    local null_ls = require('null-ls')
  
    null_ls.setup({
      sources={
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.formatting.black,
--      null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.beautysh,
      }
    })

    vim.keymap.set('n', '<C-l>', vim.lsp.buf.format, {})
  end,

}
