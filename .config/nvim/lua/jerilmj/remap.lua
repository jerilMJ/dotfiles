vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- paste without overriding paste register (aka, allows multi-paste)
vim.keymap.set('x', '<leader>p', '"_dP')

-- yank to system clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

-- paste from system clipboard
vim.keymap.set('n', '<leader>P', '"+p')
vim.keymap.set('v', '<leader>P', '"+p')

-- delete without yanking
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')

-- banish ex-mode
vim.keymap.set('n', 'Q', '<nop>')

