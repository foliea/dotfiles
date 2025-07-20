local M = {}

function M.detect_js_formatter()
	local cwd = vim.fn.getcwd()

	local biome_files = {
		"biome.json",
		"biome.jsonc",
		".biome.json",
		".biome.jsonc",
	}

	for _, file in ipairs(biome_files) do
		if vim.fn.filereadable(cwd .. "/" .. file) == 1 then
			return "biome"
		end
	end

	local package_json = cwd .. "/package.json"
	if vim.fn.filereadable(package_json) == 1 then
		local success, content = pcall(vim.fn.readfile, package_json)
		if success then
			local json_str = table.concat(content, "\n")
			if string.find(json_str, '"@biomejs/biome"') or string.find(json_str, '"biome"') then
				return "biome"
			end
		end
	end

	return "prettier"
end

function M.get_js_formatters()
	local formatter = M.detect_js_formatter()
	return formatter == "biome" and { "biome" } or { "prettierd", "prettier", stop_after_first = true }
end

return M
