require("dashboard").setup({
	-- config
	config = {
		week_header = {
			enable = true,
		},
		shortcut = {
			{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
			{
				icon = " ",
				desc = "New",
				group = "@type",
				action = "enew",
				key = "e",
			},
			{
				icon = " ",
				desc = "Theme",
				group = "@type",
				action = "Telescope colorscheme",
				key = "c",
			},
			{
				icon = " ",
				desc = "Smart Open",
				group = "Label",
				action = "Telescope smart_open",
				key = "o",
			},
			{
				icon = " ",
				desc = "Find",
				group = "Label",
				action = "Telescope find_files",
				key = "f",
			},
			{
				icon = " ",
				desc = "History",
				group = "Label",
				action = "Telescope oldfiles",
				key = "h",
			},
			{
				icon = " ",
				desc = "Grep",
				group = "Label",
				action = "Telescope live_grep",
				key = "g",
			},
			{
				icon = "󰅗 ",
				desc = "Close",
				group = "@comment",
				action = "quit",
				key = "q",
			},
		},
	},
})
