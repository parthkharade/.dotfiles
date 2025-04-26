-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.clangd.setup {}
lspconfig.pyright.setup {}
lspconfig.texlab.setup {}
