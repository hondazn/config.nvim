---@diagnostic disable: missing-fields
require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "luadoc", "printf", "vim", "vimdoc", "markdown", "markdown_inline", "typescript" },

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,
	highlight = {
		enable = true,
		use_languagetree = true,
	},

	indent = { enable = true },
})
