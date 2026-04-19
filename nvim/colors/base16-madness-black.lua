-- Base16 Madness Black
-- Author: foliea

local highlights = {}

highlights[0] = "#000000" -- base00 - Background
highlights[1] = "#141414" -- base01 - Selection/Highlight
highlights[2] = "#404040" -- base02 - Comment/Secondary background
highlights[3] = "#808080" -- base03 - Muted/Grey
highlights[4] = "#eeeeee" -- base04 - Foreground (light grey)
highlights[5] = "#ffffff" -- base05 - White
highlights[6] = "#000000" -- base06 - Cursor/Selection text
highlights[7] = "#eeeeee" -- base07 - Foreground (bright)
highlights[8] = "#e06c75" -- base08 - Red
highlights[9] = "#fab283" -- base09 - Orange
highlights[10] = "#e5c07b" -- base0A - Yellow
highlights[11] = "#7fd88f" -- base0B - Green
highlights[12] = "#56b6c2" -- base0C - Aqua
highlights[13] = "#5c9cf5" -- base0D - Blue
highlights[14] = "#9d7cd8" -- base0E - Purple
highlights[15] = "#fab283" -- base0F - Orange (secondary)

local function set_highlight(group, style)
	vim.api.nvim_set_hl(0, group, style)
end

-- Editor
set_highlight("Normal", { fg = highlights[4], bg = highlights[0] })
set_highlight("Visual", { bg = highlights[2] })
set_highlight("Cursor", { fg = highlights[6], bg = highlights[5] })
set_highlight("LineNr", { fg = highlights[3] })
set_highlight("CursorLineNr", { fg = highlights[9], bold = true })
set_highlight("CursorLine", { bg = highlights[1] })
set_highlight("CursorColumn", { bg = highlights[1] })
set_highlight("Directory", { fg = highlights[13] })
set_highlight("Title", { fg = highlights[13] })
set_highlight("MoreMsg", { fg = highlights[11] })
set_highlight("NonText", { fg = highlights[3] })
set_highlight("Search", { fg = highlights[6], bg = highlights[10] })
set_highlight("IncSearch", { fg = highlights[6], bg = highlights[9] })
set_highlight("Folded", { fg = highlights[3], bg = highlights[1] })
set_highlight("FoldColumn", { fg = highlights[12], bg = highlights[0] })
set_highlight("FloatBorder", { fg = highlights[14], bg = highlights[0] })
set_highlight("NormalFloat", { fg = highlights[4], bg = highlights[0] })
set_highlight("MatchParen", { bg = highlights[3] })

-- Syntax
set_highlight("Comment", { fg = highlights[3], italic = true })
set_highlight("Constant", { fg = highlights[9] })
set_highlight("String", { fg = highlights[11] })
set_highlight("Character", { fg = highlights[8] })
set_highlight("Number", { fg = highlights[9] })
set_highlight("Boolean", { fg = highlights[9] })
set_highlight("Type", { fg = highlights[10] })
set_highlight("Typedef", { fg = highlights[10] })
set_highlight("Struct", { fg = highlights[10] })
set_highlight("Identifier", { fg = highlights[8] })
set_highlight("Function", { fg = highlights[13] })
set_highlight("Method", { fg = highlights[13] })
set_highlight("Keyword", { fg = highlights[14] })
set_highlight("Statement", { fg = highlights[8] })
set_highlight("Conditional", { fg = highlights[14] })
set_highlight("Repeat", { fg = highlights[10] })
set_highlight("Label", { fg = highlights[10] })
set_highlight("Operator", { fg = highlights[14] })
set_highlight("PreProc", { fg = highlights[10] })
set_highlight("Include", { fg = highlights[13] })
set_highlight("Define", { fg = highlights[14] })
set_highlight("Macro", { fg = highlights[8] })
set_highlight("Special", { fg = highlights[12] })
set_highlight("Delimiter", { fg = highlights[5] })
set_highlight("Todo", { fg = highlights[6], bg = highlights[10] })
set_highlight("Error", { fg = highlights[8] })
set_highlight("ErrorMsg", { fg = highlights[6], bg = highlights[8] })
set_highlight("WarningMsg", { fg = highlights[9] })

-- Diagnostics
set_highlight("DiagnosticError", { fg = highlights[8] })
set_highlight("DiagnosticWarn", { fg = highlights[9] })
set_highlight("DiagnosticInfo", { fg = highlights[13] })
set_highlight("DiagnosticHint", { fg = highlights[12] })

-- Popup menu
set_highlight("Pmenu", { fg = highlights[4], bg = highlights[0] })
set_highlight("PmenuSel", { fg = highlights[6], bg = highlights[13] })
set_highlight("PmenuSbar", { bg = highlights[2] })
set_highlight("PmenuThumb", { bg = highlights[3] })
set_highlight("CmpItemAbbr", { fg = highlights[4] })
set_highlight("CmpItemKindCopilot", { fg = highlights[14] })
set_highlight("CmpDocNormal", { bg = highlights[0] })

-- WhichKey
set_highlight("WhichKey", { fg = highlights[14] })
set_highlight("WhichKeyFloat", { bg = highlights[0] })
set_highlight("WhichKeyBorder", { fg = highlights[14], bg = highlights[0] })
set_highlight("WhichKeyDesc", { fg = highlights[4] })
set_highlight("WhichKeyGroup", { fg = highlights[14] })
set_highlight("WhichKeySeparator", { fg = highlights[3] })
set_highlight("WhichKeyValue", { fg = highlights[3] })

-- Lazy
set_highlight("LazyNormal", { bg = highlights[0] })
set_highlight("LazyBorder", { fg = highlights[14], bg = highlights[0] })
set_highlight("LazyButton", { fg = highlights[4], bg = highlights[2] })
set_highlight("LazyButtonActive", { fg = highlights[4], bg = highlights[14] })
set_highlight("LazySpecial", { fg = highlights[3] })
set_highlight("LazyHeader", { fg = highlights[9] })
set_highlight("LazyProp", { fg = highlights[4] })
set_highlight("LazyUrl", { fg = highlights[13] })
set_highlight("LazyReason", { fg = highlights[14] })
set_highlight("LazyDimmed", { fg = highlights[3] })

-- Diff
set_highlight("DiffAdd", { fg = highlights[11], bg = highlights[1] })
set_highlight("DiffChange", { fg = highlights[10], bg = highlights[1] })
set_highlight("DiffDelete", { fg = highlights[8], bg = highlights[1] })
set_highlight("DiffText", { fg = highlights[13], bg = highlights[1] })
set_highlight("DiffviewNormal", { bg = highlights[0] })
set_highlight("DiffviewBorder", { fg = highlights[14], bg = highlights[0] })
set_highlight("DiffviewFilePanelFileName", { fg = highlights[4] })
set_highlight("DiffviewFilePanelPath", { fg = highlights[3] })
set_highlight("DiffviewFilePanelSelectedName", { fg = highlights[11] })

-- Mini
set_highlight("MiniIndentscopeSymbol", { fg = highlights[14] })
set_highlight("MiniJump2dSpot", { fg = highlights[9], bold = true })

-- Status line
set_highlight("StatusLine", { fg = highlights[4], bg = highlights[1] })
set_highlight("StatusLineNC", { fg = highlights[3], bg = highlights[1] })
set_highlight("TabLine", { fg = highlights[3], bg = highlights[1] })
set_highlight("TabLineSel", { fg = highlights[11], bg = highlights[0] })
set_highlight("TabLineFill", { fg = highlights[3], bg = highlights[1] })
set_highlight("WinBar", { fg = highlights[4] })
set_highlight("WinBarNC", { fg = highlights[3] })
set_highlight("VertSplit", { fg = highlights[3], bg = highlights[0] })

-- Git
set_highlight("GitSignsAdd", { fg = highlights[11] })
set_highlight("GitSignsChange", { fg = highlights[10] })
set_highlight("GitSignsDelete", { fg = highlights[8] })

-- Treesitter
set_highlight("TSComment", { fg = highlights[3], italic = true })
set_highlight("TSConstant", { fg = highlights[9] })
set_highlight("TSString", { fg = highlights[11] })
set_highlight("TSCharacter", { fg = highlights[8] })
set_highlight("TSNumber", { fg = highlights[9] })
set_highlight("TSBoolean", { fg = highlights[9] })
set_highlight("TSType", { fg = highlights[10] })
set_highlight("TSTypeBuiltin", { fg = highlights[10], italic = true })
set_highlight("TSIdentifier", { fg = highlights[8] })
set_highlight("TSFunction", { fg = highlights[13] })
set_highlight("TSMethod", { fg = highlights[13] })
set_highlight("TSKeyword", { fg = highlights[14] })
set_highlight("TSKeywordOperator", { fg = highlights[14] })
set_highlight("TSConditional", { fg = highlights[14] })
set_highlight("TSRepeat", { fg = highlights[10] })
set_highlight("TSLabel", { fg = highlights[10] })
set_highlight("TSOperator", { fg = highlights[14] })
set_highlight("TSPreProc", { fg = highlights[10] })
set_highlight("TSInclude", { fg = highlights[13] })
set_highlight("TSSpecial", { fg = highlights[12] })
set_highlight("TSTitle", { fg = highlights[13] })
set_highlight("TSTag", { fg = highlights[8] })
set_highlight("TSTagDelimiter", { fg = highlights[15] })

-- Telescope
set_highlight("TelescopeNormal", { bg = highlights[0] })
set_highlight("TelescopeBorder", { fg = highlights[14], bg = highlights[0] })
set_highlight("TelescopePromptNormal", { fg = highlights[4], bg = highlights[1] })
set_highlight("TelescopePromptBorder", { fg = highlights[14], bg = highlights[1] })
set_highlight("TelescopeSelection", { bg = highlights[2] })
set_highlight("TelescopeResultsTitle", { fg = highlights[14] })

-- Notify
set_highlight("NotifyERRORBorder", { fg = highlights[8] })
set_highlight("NotifyWARNBorder", { fg = highlights[14] })
set_highlight("NotifyINFOBorder", { fg = highlights[4] })
set_highlight("NotifyDEBUGBorder", { fg = highlights[12] })

-- Illuminated
set_highlight("IlluminatedWordText", { bg = highlights[2] })
set_highlight("IlluminatedWordRead", { bg = highlights[2] })
set_highlight("IlluminatedWordWrite", { bg = highlights[2] })

vim.opt.termguicolors = true
vim.opt.background = "dark"

return highlights
