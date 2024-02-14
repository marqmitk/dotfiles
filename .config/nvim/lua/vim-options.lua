vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.opt.autochdir = true

vim.g.mapleader = " "
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>', {})
vim.keymap.set('n', '<leader>ss', ':split<CR>', {})
