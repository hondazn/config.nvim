vim.diagnostic.config({ severity_sort = true, virtual_text = false })

local on_attach = function(_, bufnr)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "LSP: Go to definition" })
end

local on_init = function(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

return {
	require("lspconfig").lua_ls.setup {
		on_attach = on_attach,
		capabirities = capabilities,
		on_init = on_init,
	}
}
