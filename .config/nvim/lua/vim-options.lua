vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set termguicolors")
vim.opt.autochdir = true

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", {})
vim.api.nvim_set_keymap("n", ":", "<cmd>FineCmdline<CR>", { noremap = true })
vim.keymap.set("n", "<leader>ss", ":split<CR>", {})
vim.opt.conceallevel = 1
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true })
vim.api.nvim_set_keymap("i", "öö", "{", { noremap = true })
vim.api.nvim_set_keymap("i", "ÖÖ", "}", { noremap = true })
vim.api.nvim_set_keymap("i", "ää", "[", { noremap = true })
vim.api.nvim_set_keymap("i", "ÄÄ", "]", { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>y", ":w !wl-copy<CR><CR>", { noremap = true })
vim.opt_local.spell = true
vim.opt_local.spelllang = "en"

if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h20"
  vim.g.neovide_transparency = 0.9
  vim.g.neovide_theme = 'auto'
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
end
