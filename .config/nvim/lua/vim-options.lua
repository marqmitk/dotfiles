vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.opt.autochdir = true

vim.g.mapleader = " "
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>', {})
vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', { noremap = true })
vim.keymap.set('n', '<leader>ss', ':split<CR>', {})
vim.opt.conceallevel = 1
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true })
vim.api.nvim_set_keymap('i', 'uu', '<cmd>undo<CR>', { noremap = true }) 
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', 'öö', '{', { noremap = true })
vim.api.nvim_set_keymap('i', 'ää', '}', { noremap = true })
vim.api.nvim_set_keymap('i', 'üü', '<BS>', { noremap = true })
vim.api.nvim_set_keymap('i', 'ÜÜ', '<Del>', { noremap = true })
