return {
	"stevearc/oil.nvim",
	lazy = false,
	opts = {
		view_options = { show_hidden = true },
		keymaps = {
			["q"] = { "actions.close", mode = "n" },
			["<C-_>"] = { "actions.select", opts = { horizontal = true } },
			["<C-\\>"] = { "actions.select", opts = { vertical = true } },
		},
	},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
