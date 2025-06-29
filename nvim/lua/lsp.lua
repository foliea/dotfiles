-- LSP and completion setup
pcall(function()
  local lspconfig = require('lspconfig')
  lspconfig.ts_ls.setup{}
  lspconfig.solargraph.setup{}
  lspconfig.bashls.setup{}
  lspconfig.dockerls.setup{}
  lspconfig.prismals.setup{}
  lspconfig.jsonls.setup{}
end)

pcall(function()
  local cmp = require'cmp'
  cmp.setup({
    mapping = cmp.mapping.preset.insert({
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'buffer' },
      { name = 'path' },
    })
  })
end)
