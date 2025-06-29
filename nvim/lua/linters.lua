pcall(function()
  local conform = require('conform')

  local function find_root(bufnr, root_markers)
    -- Ensure bufnr is a number, default to current buffer if not
    bufnr = tonumber(bufnr) or vim.api.nvim_get_current_buf()

    local fname = vim.api.nvim_buf_get_name(bufnr)
    if not fname or fname == "" then
      return nil
    end
    local current_dir = vim.fn.fnamemodify(fname, ":p:h")
    local root = vim.fs.find(root_markers, { upward = true, path = current_dir, type = "any" })[1]
    if root then
      return vim.fn.fnamemodify(root, ":p:h")
    end
    return nil
  end

  local function get_js_ts_formatters(bufnr)
    local root = find_root(bufnr, {'.git', 'package.json', 'node_modules'})
    if root and vim.fn.filereadable(root .. '/biome.json') == 1 then
      return { 'biome' }
    end
    return { 'prettier', 'eslint_d' }
  end

  conform.setup {
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },

    formatters_by_ft = {
      javascript = get_js_ts_formatters,
      typescript = get_js_ts_formatters,
      javascriptreact = get_js_ts_formatters,
      typescriptreact = get_js_ts_formatters,
      ruby = { 'rubocop' },
    },

    formatters = {
      prettier = {
        command = function(bufnr)
          local root = find_root(bufnr, {'.git', 'package.json', 'node_modules'})
          if root then
            local prettier_path = root .. '/node_modules/.bin/prettier'
            if vim.fn.executable(prettier_path) == 1 then
              return prettier_path
            end
          end
          return 'prettier'
        end,
        args = { '--single-quote', '--trailing-comma', 'es5', '--stdin-filepath', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
      },

      eslint_d = {
        command = function(bufnr)
          local root = find_root(bufnr, {'.git', 'package.json', 'node_modules'})
          if root then
            local eslint_path = root .. '/node_modules/.bin/eslint_d'
            if vim.fn.executable(eslint_path) == 1 then
              return eslint_path
            end
          end
          return 'eslint_d'
        end,
      },

      biome = {
        command = function(bufnr)
          local root = find_root(bufnr, {'.git', 'package.json', 'node_modules'})
          if root then
            local biome_path = root .. '/node_modules/.bin/biome'
            if vim.fn.executable(biome_path) == 1 then
              return biome_path
            end
          end
          return 'biome'
        end,
        args = { 'format', '--stdin-filepath', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
      },

      rubocop = {
        command = 'bundle',
        args = { 'exec', 'rubocop', '--stdin', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--force-exclusion' },
      },
    }
  }
end)
