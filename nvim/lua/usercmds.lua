function Open(target)
	if vim.fn.has("macunix") == 1 then
		vim.fn.system("open " .. target)
	else
		vim.fn.system("xdg-open " .. target)
	end
end
_G.Open = Open

function ClearBuffers()
	vim.cmd("w")
	vim.cmd("%bd")
	vim.cmd("e#")
end
vim.api.nvim_create_user_command("B", ClearBuffers, {})

function RenameFile()
	local old_name = vim.fn.expand("%")
	local new_name = vim.fn.input("New file name: ", old_name, "file")
	if new_name ~= "" and new_name ~= old_name then
		vim.cmd("saveas " .. new_name)
		vim.cmd("silent !rm " .. old_name)
		vim.cmd("redraw!")
	end
end
vim.api.nvim_create_user_command("RF", RenameFile, {})

function DeleteTempFiles()
	vim.fn.system("rm ~/.local/share/nvim/tmp/backup/*")
	vim.fn.system("rm ~/.local/share/nvim/tmp/undo/*")
	vim.fn.system("rm ~/.local/share/nvim/tmp/swap/*")
end
vim.api.nvim_create_user_command("DTF", DeleteTempFiles, {})

function MakeExecutable()
	local filename = vim.fn.expand("%:p")
	vim.fn.system("chmod +x " .. filename)
end
vim.api.nvim_create_user_command("ME", MakeExecutable, {})

vim.cmd([[cabbrev ls Telescope buffers]])

function _G.TelescopeHighlights()
	local telescope = require("telescope.builtin")
	local get_hl_by_name = vim.api.nvim_get_hl_by_name
	local highlights = {}

	-- Capture the output of :highlight command
	local hl_output = vim.api.nvim_exec("highlight", true)

	for line in hl_output:gmatch("([^\n]+)") do
		-- Extract the highlight group name (first word)
		local name = line:match("^%S+")
		if name then
			-- Try to get the highlight info using nvim_get_hl_by_name
			local success, hl_info = pcall(get_hl_by_name, name, true)
			if success and hl_info then
				local fg = hl_info.foreground and string.format("#%06x", hl_info.foreground) or "N/A"
				local bg = hl_info.background and string.format("#%06x", hl_info.background) or "N/A"
				table.insert(highlights, {
					value = string.format("%-30s fg: %-10s bg: %s", name, fg, bg),
					display = string.format("%-30s fg: %-10s bg: %s", name, fg, bg),
					hl_group = name,
				})
			end
		end
	end

	table.sort(highlights, function(a, b)
		return a.hl_group < b.hl_group
	end)

	telescope.find_files({
		prompt_title = "Highlights",
		finder = require("telescope.finders").new_table({
			results = highlights,
			entry_maker = function(entry)
				return {
					value = entry.value,
					display = entry.display,
					ordinal = entry.value,
					hl_group = entry.hl_group,
				}
			end,
		}),
		sorter = require("telescope.sorters").get_generic_fuzzy_sorter(),
		previewer = require("telescope.previewers").vim_buffer_cat.new({
			get_buffer_by_name = function(entry)
				return vim.api.nvim_create_buf(false, true)
			end,
			define_preview = function(self, entry)
				vim.api.nvim_buf_set_lines(self.bufnr, 0, -1, false, { entry.value })
				vim.api.nvim_buf_set_option(self.bufnr, "filetype", "lua")
			end,
		}),
	})
end

vim.api.nvim_create_user_command("TelescopeHighlights", _G.TelescopeHighlights, {})
