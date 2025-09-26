return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = true,
	event = "VeryLazy",
	opts = {
		defaults = {
			prompt_prefix = "   ",
			selection_caret = " ",
			entry_prefix = " ",
			sorting_strategy = "ascending",
			layout_config = {
				horizontal = {
					prompt_position = "top",
					preview_width = 0.55,
				},
				width = 0.87,
				height = 0.80,
			},
			mappings = {
				i = {
					["<C-_>"] = "select_horizontal",
					["<C-\\>"] = "select_vertical",
				},
				n = {
					["<C-_>"] = "select_horizontal",
					["<C-\\>"] = "select_vertical",
				},
			},
		},
		pickers = {
			colorscheme = {
				enable_preview = true,
			},
			find_files = {
				find_command = { "rg", "--ignore", "--files", "--hidden", "--glob", "!**/.git/*" },
			},
		},
	},
}
