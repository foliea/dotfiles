local colors = require("colors")

vim.opt.termguicolors = true

vim.cmd("colorscheme " .. colors.scheme.vim)

-- Code completion and git blame
vim.api.nvim_set_hl(0, "Pmenu", { fg = colors.foreground, bg = colors.background })
vim.api.nvim_set_hl(0, "PmenuSel", { fg = colors.white, bg = colors.selection })
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = colors.blue })
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = colors.selection })
vim.api.nvim_set_hl(0, "CmpDocNormal", { bg = colors.background })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = colors.background })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = colors.background })
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = colors.aqua })

-- Notification
vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = colors.red })
vim.api.nvim_set_hl(0, "NotifyWARNBorder", { fg = colors.orange })
vim.api.nvim_set_hl(0, "NotifyHINTBorder", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = colors.green })
vim.api.nvim_set_hl(0, "NotifyERRORIcon", { fg = colors.red })
vim.api.nvim_set_hl(0, "NotifyWARNTIcon", { fg = colors.orange })
vim.api.nvim_set_hl(0, "NotifyHINTIcon", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "NotifyINFOIcon", { fg = colors.green })
vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = colors.red })
vim.api.nvim_set_hl(0, "NotifyWARNTitle", { fg = colors.orange })
vim.api.nvim_set_hl(0, "NotifyHINTTitle", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "NotifyINFOTitle", { fg = colors.green })

-- Code editor
vim.api.nvim_set_hl(0, "Delimiter", { fg = colors.white })
vim.api.nvim_set_hl(0, "@string.special", { fg = colors.orange })
vim.api.nvim_set_hl(0, "@string.regexp", { fg = colors.green })
vim.api.nvim_set_hl(0, "@string.escape", { fg = colors.orange })
vim.api.nvim_set_hl(0, "@variable", { fg = colors.red })

-- Bufferline
vim.api.nvim_set_hl(0, "BufferLineModified", { fg = colors.orange })
vim.api.nvim_set_hl(0, "BufferLineModifiedVisible", { fg = colors.orange })
vim.api.nvim_set_hl(0, "BufferLineModifiedSelected", { fg = colors.orange })
vim.api.nvim_set_hl(0, "BufferLineFill", { bg = colors.current_line })
vim.api.nvim_set_hl(0, "BufferLineSeparator", { fg = colors.current_line })
vim.api.nvim_set_hl(0, "BufferLineSeparatorVisible", { fg = colors.current_line })
vim.api.nvim_set_hl(0, "BufferLineSeparatorSelected", { fg = colors.current_line })
vim.api.nvim_set_hl(0, "BufferLineTabSeparator", { fg = colors.current_line })
vim.api.nvim_set_hl(0, "BufferLineTabSeparatorSelected", { fg = colors.current_line })
vim.api.nvim_set_hl(0, "BufferLineGroupLabel", { fg = colors.current_line })
vim.api.nvim_set_hl(0, "BufferLineTruncMarker", { bg = colors.current_line })
vim.api.nvim_set_hl(0, "BufferLineOffsetSeparator", { bg = colors.current_line })
vim.api.nvim_set_hl(0, "BufferLineGroupSeparator", { bg = colors.current_line })

-- Ruby icons
vim.api.nvim_set_hl(0, "DevIconRb", { fg = "#e8274b" })
vim.api.nvim_set_hl(0, "DevIconErb", { fg = "#e8274b" })
vim.api.nvim_set_hl(0, "DevIconConfigRu", { fg = "#e8274b" })
vim.api.nvim_set_hl(0, "DevIconGemfile", { fg = "#e8274b" })
vim.api.nvim_set_hl(0, "DevIconRake", { fg = "#e8274b" })
vim.api.nvim_set_hl(0, "DevIconRakefile", { fg = "#e8274b" })
