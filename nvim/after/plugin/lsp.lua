local lsp_zero = require('lsp-zero')

lsp_zero.preset("recommended")

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp_zero.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true}),
  ['<C-Space>'] = cmp.mapping.complete(),
})

lsp_zero.set_preferences({
	sign_icons = { }
})

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
  require('mason-lspconfig').setup({
    -- Replace the language servers listed here 
    -- with the ones you want to install
    ensure_installed = {'clangd', 'cmake'},
    handlers = {
      lsp_zero.default_setup,
    },
  })
