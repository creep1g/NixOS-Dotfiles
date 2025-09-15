local pywal = require('pywal')
pywal.setup()
vim.api.nvim_set_keymap('n', '<Leader>w', ':colorscheme pywal<cr>', { noremap = true })
