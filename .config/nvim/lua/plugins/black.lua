vim.api.nvim_set_keymap('n', '<leader>f', [[:%!black -q -l 80 -t py311 -<CR>]], { noremap = true, silent = true })

