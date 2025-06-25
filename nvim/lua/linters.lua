pcall(function()
  require('conform').setup {
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },

    formatters_by_ft = {
      javascript = { 'prettier', 'eslint_d' },
      typescript = { 'prettier', 'eslint_d' },
      javascriptreact = { 'prettier', 'eslint_d' },
      typescriptreact = { 'prettier', 'eslint_d' },
      ruby = { 'rubocop' },
      json = { 'prettier' },
      yaml = { 'prettier' },
      markdown = { 'prettier' },
      html = { 'prettier' },
      css = { 'prettier' },
      scss = { 'prettier' },
      less = { 'prettier' },
      vue = { 'prettier' },
    },

    formatters = {
      prettier = {
        command = function(bufnr)
          local root = conform.get_root(bufnr)
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
          local root = conform.get_root(bufnr)
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
          local root = conform.get_root(bufnr)
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
