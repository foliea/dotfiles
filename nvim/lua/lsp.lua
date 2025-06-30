-- LSP and completion setup
pcall(function()
  local lspconfig = require('lspconfig')

  lspconfig.solargraph.setup{}
  lspconfig.ts_ls.setup{}
  lspconfig.bashls.setup{}
  lspconfig.dockerls.setup{
    on_attach = function(client, bufnr)
      client.server_capabilities.semanticTokensProvider = nil
    end,
  }
  lspconfig.prismals.setup{}
  lspconfig.jsonls.setup {
    capabilities = capabilities,
    settings = {
      json = {
        schemas = require('schemastore.json').schemas(),
        validate = { enable = true },
      },
    },
    cmd = { "bash", "-c", "which vscode-json-languageserver && exec $(which vscode-json-languageserver) --stdio" },
    on_attach = function(client, bufnr)
      client.name = "jsonls"
      require('completion').on_attach(client, bufnr)
    end,
  }
end)

pcall(function()
  require("copilot").setup({
    suggestion = { enabled = false },
    panel = { enabled = false },
  })
end)

pcall(function()
  require("copilot_cmp").setup()
end)

pcall(function()
  local cmp = require('cmp')

  cmp.setup({
    mapping = cmp.mapping.preset.insert({
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    }),
    sources = cmp.config.sources({
      { name = "copilot" },
      { name = 'nvim_lsp' },
      { name = 'buffer' },
      { name = 'path' },
    })
  })
end)
