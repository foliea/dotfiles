function RenameFile()
	local old_name = vim.fn.expand("%")
	local new_name = vim.fn.input("New file name: ", old_name, "file")
	if new_name ~= "" and new_name ~= old_name then
		vim.cmd("saveas " .. new_name)
		vim.cmd("silent !rm " .. old_name)
		vim.cmd("redraw!")
	end
end
vim.api.nvim_create_user_command("RenameFile", RenameFile, {})

function DeleteTempFiles()
	vim.fn.system("rm ~/.local/share/nvim/tmp/backup/*")
	vim.fn.system("rm ~/.local/share/nvim/tmp/undo/*")
	vim.fn.system("rm ~/.local/share/nvim/tmp/swap/*")
end
vim.api.nvim_create_user_command("DeleteTempFiles", DeleteTempFiles, {})

function MakeExecutable()
	local filename = vim.fn.expand("%:p")
	vim.fn.system("chmod +x " .. filename)
end
vim.api.nvim_create_user_command("MakeExecutable", MakeExecutable, {})

-- Custom Telescope picker for bufferline ordinals
local has_telescope, pickers = pcall(require, "telescope.pickers")
if has_telescope then
	local finders = require("telescope.finders")
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local conf = require("telescope.config").values

	local function bufferline_ordinals_picker()
		local bufferline = require("bufferline.state")
		local entries = {}
		for i, buf in ipairs(bufferline.components) do
			local name = vim.fn.fnamemodify(vim.fn.bufname(buf.id), ":t")
			table.insert(entries, { ordinal = i, name = name, id = buf.id })
		end

		pickers
			.new({}, {
				prompt_title = "Buffer Ordinals",
				finder = finders.new_table({
					results = entries,
					entry_maker = function(entry)
						return {
							value = entry,
							display = string.format("%d: %s", entry.ordinal, entry.name),
							ordinal = tostring(entry.ordinal) .. " " .. entry.name,
						}
					end,
				}),
				sorter = conf.generic_sorter({}),
				attach_mappings = function(prompt_bufnr, _)
					actions.select_default:replace(function()
						actions.close(prompt_bufnr)
						local selection = action_state.get_selected_entry()
						if selection and selection.value and selection.value.ordinal then
							vim.cmd("BufferLineGoToBuffer " .. selection.value.ordinal)
						end
					end)
					return true
				end,
			})
			:find()
	end

	vim.api.nvim_create_user_command("TabsList", bufferline_ordinals_picker, {})
end
