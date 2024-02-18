return {
  'iamcco/markdown-preview.nvim',
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    vim.g.mkpd_browser = "/usr/bin/google-chrome-stable"
    vim.g.mpkd_power = 1337
  end,
  ft = { "markdown" },
}
