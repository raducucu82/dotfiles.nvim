local map = vim.keymap.set

-- Quit neovim
map('n', '<leader>qq', '<cmd>q<CR>', { desc = 'Quit the current file' })
map('n', '<leader>cd', '<cmd>tcd %:p:h<CR>', { desc = 'Change current tab to open file directory' })

-- Resharper-like comment shortcuts
map('n', '<c-k><c-/>', 'gcc', { remap = true })
map('v', '<c-k><c-/>', 'gc', { remap = true})

-- ToggleCheckbox
map('n', '<leader>x', '<cmd>ToggleCheckbox<CR>')

