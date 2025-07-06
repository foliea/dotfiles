-- Code navigation
vim.g.EasyMotion_leader_key = ";"

vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })

-- Pane navigation
vim.api.nvim_set_keymap("", "<Up>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("", "<Down>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("", "<Left>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("", "<Right>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-H>", "<C-W><C-H>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-J>", "<C-W><C-J>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-K>", "<C-W><C-K>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-L>", "<C-W><C-L>", { noremap = true })

-- Buffer navigation
vim.api.nvim_set_keymap("n", "<S-J>", ":bprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-K>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>co", ":BufferLineCloseOthers<CR>", { noremap = true, silent = true })

-- Tests runner
vim.api.nvim_set_keymap("n", "<leader>t", ":TestNearest<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>f", ":TestFile<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>l", ":TestLast<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>v", ":TestVisit<CR>", { noremap = true, silent = true })

-- Folding
vim.api.nvim_set_keymap("n", "<leader>co", ":BufferLineCloseOthers<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>of",
	[[<cmd>lua require('ufo').openAllFolds()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>cf",
	[[<cmd>lua require('ufo').closeAllFolds()<CR>]],
	{ noremap = true, silent = true }
)

-- File explorer / Symbols outline
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ef", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>so", ":Outline<CR>", { noremap = true })

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

-- Git
vim.api.nvim_set_keymap("n", "<leader>do", ":DiffviewOpen<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>dc", ":DiffviewClose<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gb", ":Gitsigns blame_line<CR>", { noremap = true, silent = true })

-- Help / Diagnostics
vim.api.nvim_set_keymap("n", "<leader>hk", ":Telescope keymaps<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>hc", ":Telescope commands<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>hd", ":Trouble<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ha", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
