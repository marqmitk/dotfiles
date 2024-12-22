vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set termguicolors")

vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", ":", "<cmd>FineCmdline<CR>", { noremap = true })
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>y", ":w !wl-copy<CR><CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "ss", ":split<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "sv", ":vsplit<CR>", { noremap = true })

vim.opt.conceallevel = 1
vim.opt_local.spell = true
vim.opt_local.spelllang = "en"
vim.opt.autochdir = true

-- disable transparency of NeoTreeNormal
vim.cmd("highlight! link NeoTreeNormal Normal")
