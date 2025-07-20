local colors = require("config.colors")

vim.opt.background = "dark"
vim.opt.termguicolors = true

if colors.scheme.vim == "none" then
	require("base16-colorscheme").setup({
		base00 = colors.background,
		base01 = colors.panel,
		base02 = colors.selection,
		base03 = colors.muted,
		base04 = colors.foreground,
		base05 = colors.white,
		base06 = colors.black,
		base07 = colors.foreground,
		base08 = colors.red,
		base09 = colors.orange,
		base0A = colors.yellow,
		base0B = colors.green,
		base0C = colors.aqua,
		base0D = colors.blue,
		base0E = colors.purple,
		base0F = colors.orange,
	})
else
	vim.cmd("colorscheme " .. colors.scheme.vim)
end

require("base16-colorscheme").with_config({
	telescope = true,
	indentblankline = false,
	notify = true,
	ts_rainbow = false,
	cmp = false,
	illuminate = false,
	dapui = false,
})

-- Code completion and git blame
vim.api.nvim_set_hl(0, "Pmenu", { fg = colors.foreground, bg = colors.background })
vim.api.nvim_set_hl(0, "PmenuSel", { fg = colors.white, bg = colors.selection })
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = colors.blue })
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = colors.selection })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = colors.background })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = colors.background })
vim.api.nvim_set_hl(0, "CmpDocNormal", { bg = colors.background })
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = colors.purple })
vim.api.nvim_set_hl(0, "CmpItemAbbr", { bg = colors.background })

-- Code editor
vim.api.nvim_set_hl(0, "Delimiter", { fg = colors.white })

-- Ruby icons
vim.api.nvim_set_hl(0, "DevIconRb", { fg = "#e8274b" })
vim.api.nvim_set_hl(0, "DevIconErb", { fg = "#e8274b" })
vim.api.nvim_set_hl(0, "DevIconConfigRu", { fg = "#e8274b" })
vim.api.nvim_set_hl(0, "DevIconGemfile", { fg = "#e8274b" })
vim.api.nvim_set_hl(0, "DevIconRake", { fg = "#e8274b" })
vim.api.nvim_set_hl(0, "DevIconRakefile", { fg = "#e8274b" })
