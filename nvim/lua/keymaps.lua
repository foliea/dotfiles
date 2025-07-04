-- Key mappings
vim.api.nvim_set_keymap('', '<Up>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('', '<Down>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('', '<Left>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('', '<Right>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true })

vim.g.EasyMotion_leader_key = ';'

vim.api.nvim_set_keymap('n', '<C-P>', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-F>', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-I>', [[<cmd>lua require('CopilotChat').toggle()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sr', [[<cmd>lua require('spectre').open()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><C-P>', ':Telescope commands<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>hf', ':Telescope find_files hidden=true<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>t',  ':TestNearest<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>f',  ':TestFile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>l',  ':TestLast<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>v',  ':TestVisit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>so', ':Outline<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>e',  ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ef', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tt', ':TodoTelescope<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tb', ':Trouble<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lg', ':LazyGit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>df', ':DiffviewOpen<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dc', ':DiffviewClose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>co', ':BufferLineCloseOthers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gb', ':Gitsigns blame_line<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tk', ':Telescope keymaps<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ls', ':Telescope resume<CR>', { noremap = true, silent = true })

-- Buffer navigation
vim.api.nvim_set_keymap('n', '<S-J>', ':bprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-K>', ':bnext<CR>', { noremap = true, silent = true })

-- Native LSP keymaps
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })

-- Folding keymaps
vim.api.nvim_set_keymap('n', 'of', [[<cmd>lua require('ufo').openAllFolds()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'cf', [[<cmd>lua require('ufo').closeAllFolds()<CR>]], { noremap = true, silent = true })
