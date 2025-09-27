return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		bufdelete = { enabled = true },
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
		dim = { enabled = true },
		git = { enabled = true },
		gitbrowse = { enabled = true },
		health = { enabled = true },
		image = { enabled = true },
		indent = { enabled = false },
		input = { enabled = false },
		notifier = { enabled = true },
		notify = { enabled = true },
		quickfile = { enabled = false },
		rename = { enabled = true },
		scope = { enabled = true },
		scratch = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = false },
		terminal = { enabled = true, win = { style = "terminal" }, shell = "fish" },
		toggle = { enabled = false },
		words = { enabled = true },
		lazygit = { enabled = true, configure = true },
		picker = { enabled = true, sources = { files = { hidden = true } } },
	},
}
