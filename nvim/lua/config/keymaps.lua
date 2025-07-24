-- Code navigation
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })

-- Disable arrow keys
vim.api.nvim_set_keymap("", "<Up>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("", "<Down>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("", "<Left>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("", "<Right>", "<Nop>", { noremap = true })

-- Buffer navigation
vim.api.nvim_set_keymap("n", "<S-J>", ":bprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-K>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>co", ":BufferLineCloseOthers<CR>", { noremap = true, silent = true })

-- Tests runner
vim.api.nvim_set_keymap("n", "<leader>t", ":TestNearest<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>f", ":TestFile<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>l", ":TestLast<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>v", ":TestVisit<CR>", { noremap = true, silent = true })

-- File explorer / Symbols outline
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ef", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>so", ":Trouble symbols toggle focus=false<CR>", { noremap = true })

-- Fuzzy Finder / Search & Replace
vim.api.nvim_set_keymap(
	"n",
	"<C-P>",
	[[<cmd>lua require('telescope.builtin').find_files()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<C-F>",
	[[<cmd>lua require('telescope.builtin').live_grep()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<leader>ls", ":Telescope resume<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>sh", ":Telescope find_files hidden=true<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>sr",
	[[<cmd>lua require('spectre').open()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<leader>st", ":TodoTelescope<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })

-- Git
vim.api.nvim_set_keymap("n", "<leader>gb", ":Gitsigns blame_line<CR>", { noremap = true, silent = true })

-- Help / Diagnostics
vim.api.nvim_set_keymap("n", "<leader>hk", ":Telescope keymaps<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>hc", ":Telescope commands<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>hd", ":Trouble<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ha", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap(
	"n",
	"<leader>do",
	":Trouble diagnostics toggle filter.buf=0<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>di",
	"<cmd>lua vim.diagnostic.open_float(0, { scope = 'cursor' })<CR>",
	{ noremap = true, silent = true }
)
