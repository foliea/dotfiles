function Open(target)
	if vim.fn.has("macunix") == 1 then
		vim.fn.system("open " .. target)
	else
		vim.fn.system("xdg-open " .. target)
	end
end
_G.Open = Open


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
