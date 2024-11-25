require('mini.align').setup()
require('mini.tabline').setup()
require('mini.pairs').setup()
require('mini.pick').setup()
require('mini.fuzzy').setup()

vim.keymap.set('n', '<leader>ff', '<cmd>Pick files<cr>', { desc = 'Pick files' })
vim.keymap.set('n', '<leader>fb', '<cmd>Pick buffers<cr>', { desc = 'Pick files' })
vim.keymap.set('n', '<leader>fg', '<cmd>Pick grep_live<cr>', { desc = 'Pick files' })
