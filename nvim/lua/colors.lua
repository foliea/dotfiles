local uv = vim.loop

local function read_json(path)
	local fd = assert(uv.fs_open(path, "r", 438))
	local stat = assert(uv.fs_fstat(fd))
	local data = assert(uv.fs_read(fd, stat.size, 0))
	uv.fs_close(fd)
	return vim.fn.json_decode(data)
end

local colors = read_json(vim.fn.expand("~/.config/omamad/themes/default/neovim.json"))

return colors
