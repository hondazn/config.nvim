return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		display = {
			action_palette = {
				provider = "telescope",
			},
		},
		strategies = {
			chat = {
				adapter = "copilot",
				slash_commands = {
					["file"] = {
						opts = {
							provider = "telescope",
						},
					},
					["buffer"] = {
						opts = {
							provider = "telescope",
						},
					},
				},
			},
			inline = {
				adapter = "copilot",
			},
			agent = {
				adapter = "copilot",
			},
		},
	},
}
