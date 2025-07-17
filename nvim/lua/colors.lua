local function read_json(path)
  local lines = vim.fn.readfile(path)
  local data = table.concat(lines, "\n")
  return vim.fn.json_decode(data)
end

local colors = read_json(vim.fn.expand("~/.config/themes/default/neovim.json"))
return colors
