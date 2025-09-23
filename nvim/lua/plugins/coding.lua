return {
	-- Comments
	{
		"scrooloose/nerdcommenter",
		event = "BufReadPost",
	},


	-- Test runner
	{
		"janko-m/vim-test",
		cmd = { "TestNearest", "TestFile", "TestLast", "TestVisit" },
		init = function()
			vim.g["test#javascript#jest#executable"] = "npm test --"
			vim.g["test#basic#start_normal"] = 1
		end,
	},

	-- TMUX integration
	{
		"christoomey/vim-tmux-navigator",
		event = "VeryLazy",
	},

	-- Session management
	{
		"tpope/vim-obsession",
		cmd = { "Obsess", "Obsession" },
	},

	-- Auto create directories
	{
		"pbrisbin/vim-mkdir",
		event = "BufWritePre",
	},

	-- Markdown preview
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		build = "cd app && npx --yes yarn install",
		cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
	},
}
