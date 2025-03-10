return {
	{ "vim-jp/vimdoc-ja" },
	{ "folke/which-key.nvim" },
	{
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
					-- { section = "header" },
					{
						section = "terminal",
						cmd = "bash -c '~/.config/nvim/scripts/n.bash' 2>/dev/null",
						indent = 30,
						height = 15,
						caching = false,
					},
					{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
					{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
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
			scroll = { enabled = true },
			-- statuscolumn = { enabled = true },
			words = { enabled = true },
			lazygit = { enabled = true, configure = true },
		},
	},
	{
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
	},
	{
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
	},
	{
		"folke/flash.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
		keys = {
			-- {
			-- 	"s",
			-- 	mode = { "n", "x", "o" },
			-- 	function()
			-- 		require("flash").jump()
			-- 	end,
			-- 	desc = "Flash",
			-- },
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
	{
		"sphamba/smear-cursor.nvim",
		lazy = true,
		event = "VeryLazy",
		opts = {},
	},
	{
		"danielfalk/smart-open.nvim",
		branch = "0.2.x",
		lazy = true,
		config = function()
			require("telescope").load_extension("smart_open")
		end,
		dependencies = {
			"kkharji/sqlite.lua",
			-- Only required if using match_algorithm fzf
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			-- Optional.  If installed, native fzy will be used when match_algorithm is fzy
			{ "nvim-telescope/telescope-fzy-native.nvim" },
		},
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("config.lualine")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		lazy = true,
		version = "*",
		opts = {},
	},
	{
		"romgrk/barbar.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			-- animation = true,
			-- insert_at_start = true,
			-- …etc.
		},
	},
	{
		"shellRaining/hlchunk.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("hlchunk").setup({
				chunk = { enable = true },
				indent = {
					enable = true,
					chars = { "¦" },
					style = {
						vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
					},
				},
			})
		end,
	},
	{
		"b0o/incline.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{
		"folke/noice.nvim",
		lazy = true,
		event = "VeryLazy",
		opts = {
			-- add any options here
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
			messages = {
				enabled = true,
				view = "mini",
				view_error = "notify",
				view_warn = "notify",
				view_history = "messages",
				view_search = false,
			},
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		-- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
		-- dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		ft = { "markdown", "Avante", "octo", "codecompanion" },
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			preset = "obsidian",
			checkbox = {
				unchecked = { icon = "󰄰 ", highlight = "RenderMarkdownUnchecked", scope_highlight = nil },
				checked = { icon = "󰄴 ", highlight = "RenderMarkdownChecked", scope_highlight = nil },
				custom = {
					todo = { raw = "", rendered = "", highlight = "" },
					forward = {
						raw = "[>]",
						rendered = " ",
						highlight = "RenderMarkdownInfo",
						scope_highlight = nil,
					},
					incomplete = {
						raw = "[/]",
						rendered = " ",
						highlight = nil,
						scope_highlight = nil,
					},
					warn = { raw = "[!]", rendered = " ", highlight = "RenderMarkdownWarn", scope_highlight = nil },
					canceled = {
						raw = "[-]",
						rendered = "󰍴 ",
						highlight = "RenderMarkdownDash",
						scope_highlight = "@markup.strikethrough",
					},
					scheduled = {
						raw = "[<]",
						rendered = " ",
						highlight = "RenderMarkdownInfo",
						scope_highlight = nil,
					},
					question = {
						raw = "[?]",
						rendered = " ",
						highlight = "RenderMarkdownInfo",
						scope_highlight = nil,
					},
					star = {
						raw = "[*]",
						rendered = "󰓎 ",
						highlight = "RenderMarkdownInfo",
						scope_highlight = nil,
					},
					pros = {
						raw = "[p]",
						rendered = " ",
						highlight = "RenderMarkdownInfo",
						scope_highlight = nil,
					},
					cons = {
						raw = "[c]",
						rendered = " ",
						highlight = "RenderMarkdownInfo",
						scope_highlight = nil,
					},
				},
			},
		},
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = { "markdown", "octo" },
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		-- event = {
		--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		--   -- refer to `:h file-pattern` for more examples
		--   "BufReadPre path/to/my-vault/*.md",
		--   "BufNewFile path/to/my-vault/*.md",
		-- },
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",

			-- see below for full list of optional dependencies 👇
		},
		opts = {
			ui = {
				enable = false,
				checkboxes = {
					[" "] = { char = "󰄰 ", hl_group = "ObsidianTodo" },
					["/"] = { char = " ", hl_group = "ObsidianTodo" },
					["x"] = { char = "󰄴 ", hl_group = "ObsidianDone" },
					["-"] = { char = "󰍴 ", hl_group = "ObsidianDone" },
					-- [">"] = { char = " ", hl_group = "ObsidianRightArrow" },
					-- ["<"] = { char = " ", hl_group = "ObsidianRightArrow" },
					-- ["!"] = { char = " ", hl_group = "ObsidianImportant" },
					-- ["?"] = { char = " ", hl_group = "ObsidianImportant" },
					-- ["*"] = { char = "󰓎 ", hl_group = "ObsidianImportant" },
					-- ["i"] = { char = " ", hl_group = "ObsidianImportant" },
					-- ["p"] = { char = " ", hl_group = "ObsidianImportant" },
					-- ["c"] = { char = " ", hl_group = "ObsidianImportant" },
				},
			},
			workspaces = {
				{
					name = "buf-parent",
					path = function()
						return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
					end,
				},
			},
			-- see below for full list of options 👇
			disable_frontmatter = true,
		},
	},
	{
		"pwntester/octo.nvim",
		lazy = true,
		cmd = "Octo",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "nvim-tree/nvim-web-devicons" },
		-- config = function()
		-- 	require("octo").setup {
		-- 	mappings_disable_default = true,
		-- 	mappings = {
		-- 		issue = {
		-- 			list = "<leader>ghi",
		-- 		},
		-- 		pull_request = {
		-- 			list = "<leader>ghp",
		-- 		},
		-- 	}
		-- 	}
		-- end,
		opts = {
			mappings_disable_default = true,
			-- mappings = {
			-- 	issue = {
			-- 		list = "<leader>ghi",
			-- 	},
			-- 	pull_request = {
			-- 		list = "<leader>ghp",
			-- 	},
			-- }
		},
	},
	{
		"nvzone/showkeys",
		lazy = true,
		cmd = "ShowkeysToggle",
		opts = {
			timeout = 1,
			maxkeys = 5,
		},
	},
}
