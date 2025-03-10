local lspconfig = require("lspconfig")
vim.diagnostic.config({ severity_sort = true, virtual_text = false })

local on_attach = function(_, bufnr)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "LSP: Go to definition" })
end

local on_init = function(client, _)
	if client.supports_method("textDocument/semanticTokens") then
		client.server_capabilities.semanticTokensProvider = nil
	end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

lspconfig.lua_ls.setup({})
lspconfig.denols.setup({
	on_attach = on_attach,
	capabirities = capabilities,
	on_init = on_init,
	root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
})
lspconfig.ts_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	on_init = on_init,
	root_dir = lspconfig.util.root_pattern("package.json"),
	single_file_support = false,
})
lspconfig.biome.setup({})
lspconfig.rust_analyzer.setup({
	-- on_attach = on_attach,
	on_attach = function(client, bufnr)
		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
	end,
	capabilities = capabilities,
	on_init = on_init,
	settings = {
		["rust-analyzer"] = {
			diagnostics = {
				enable = true,
				experimental = {
					enable = true,
				},
			},
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
			},
			procMacro = {
				enable = true,
			},
		},
	},
})
lspconfig.intelephense.setup({})
