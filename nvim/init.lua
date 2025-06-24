-- Load plugin management, options, keymaps, autocommands, LSP, and user commands modules
require('plugins')
require('options')
require('keymaps')
require('autocmds')
require('lsp')
require('usercmds')

-- Set Tomorrow Night Eighties as the colorscheme (base16)

-- CopilotChat.nvim setup
pcall(function()
  require("CopilotChat").setup {
    model = "gpt-4.1"
  }
end)

-- Telescope ui-select setup
pcall(function()
  require("telescope").setup {
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {
        }
      },
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      }
    }
  }
  require("telescope").load_extension("ui-select")
  require("telescope").load_extension("fzf")
end)

-- Treesitter setup for better syntax highlighting
pcall(function()
  require'nvim-treesitter.configs'.setup {
    ensure_installed = { "ruby", "javascript", "typescript", "lua", "bash", "dockerfile", "json", "yaml", "markdown" },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  }
end)

-- Gitsigns setup
pcall(function()
  require('gitsigns').setup()
end)

-- NvimTree setup
pcall(function()
  require('nvim-tree').setup()
end)

pcall(function()
  require("todo-comments").setup()
end)

pcall(function()
  require("trouble").setup {}
end)

-- Lualine setup (after plugin block)
pcall(function()
  require('lualine').setup {
    options = {
      theme = 'auto',
      icons_enabled = true,
      section_separators = '',
      component_separators = '',
    },
    -- You can customize sections/components here
  }
end)

-- Bufferline setup
pcall(function()
  require("bufferline").setup{
    options = {
      show_buffer_icons = true, -- enable filetype icons
      show_buffer_close_icons = true,
      show_close_icon = true,
      separator_style = "slant", -- looks modern with icons
    }
  }
end)

vim.notify = require("notify")
vim.diagnostic.config({
  signs = true,
  virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type

  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end