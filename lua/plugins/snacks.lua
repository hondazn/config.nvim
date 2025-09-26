return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		bufdelete = { enabled = false },
		dashboard = {
			enabled = true,
			width = 80,
			sections = {
				{ header = vim.fn.system("bash -c '~/.config/nvim/scripts/kakugen.bash'") },
				{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
				{ section = "startup" },
			},
		},
		debug = { enabled = false },
		indent = { enabled = false },
		input = { enabled = false },
		notifier = { enabled = false },
		quickfile = { enabled = false },
		scratch = { enabled = false },
		scroll = { enabled = false },
		-- statuscolumn = { enabled = true },
		words = { enabled = true },
		lazygit = { enabled = true, configure = true },
	},
}
