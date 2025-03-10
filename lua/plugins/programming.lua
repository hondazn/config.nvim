return {
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = { "UIEnter", "BufReadPost", "BufNewFile" },
		config = function()
			require("config.lspconfig")
		end,
	},
	-- AI coding
	{
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
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		lazy = true,
		event = "InsertEnter",
		opts = {
			suggestion = {
				auto_trigger = true,
			},
			filetypes = {
				yaml = true,
				markdown = true,
			},
		},
	},
	-- {
	-- 	"yetone/avante.nvim",
	-- 	lazy = false,
	-- 	event = "VeryLazy",
	-- 	version = false, -- set this if you want to always pull the latest change
	-- 	opts = {
	-- 		-- add any opts here
	-- 		provider = "copilot",
	-- 	},
	-- 	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	-- 	build = "make",
	-- 	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	-- 	dependencies = {
	-- 		"stevearc/dressing.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"MunifTanjim/nui.nvim",
	-- 		--- The below dependencies are optional,
	-- 		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
	-- 		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
	-- 		"zbirenbaum/copilot.lua", -- for providers='copilot'
	-- 		{
	-- 			-- support for image pasting
	-- 			"HakonHarnes/img-clip.nvim",
	-- 			event = "VeryLazy",
	-- 			opts = {
	-- 				-- recommended settings
	-- 				default = {
	-- 					embed_image_as_base64 = false,
	-- 					prompt_for_file_name = false,
	-- 					drag_and_drop = {
	-- 						insert_mode = true,
	-- 					},
	-- 					-- required for Windows users
	-- 					use_absolute_path = true,
	-- 				},
	-- 			},
	-- 		},
	-- 		-- {
	-- 		-- 	-- Make sure to set this up properly if you have lazy=true
	-- 		-- 	"MeanderingProgrammer/render-markdown.nvim",
	-- 		-- 	opts = {
	-- 		-- 		file_types = { "markdown", "Avante" },
	-- 		-- 	},
	-- 		-- 	ft = { "markdown", "Avante" },
	-- 		-- },
	-- 	},
	-- },
	-- formatting!
	{
		"stevearc/conform.nvim",
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				typescript = { "biome-check", stop_after_first = true },
				javascript = { "biome-check", stop_after_first = true },
				typescriptreact = { "biome-check", stop_after_first = true },
				javascriptreact = { "biome-check", stop_after_first = true },
				json = { "biome" },
				jsonc = { "biome" },
				html = { "biome-check" },
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		config = function()
			require("config.treesitter")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},
	{
		"folke/ts-comments.nvim",
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
		opts = {},
	},
	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},
	{
		"hrsh7th/nvim-cmp",
		lazy = true,
		event = "InsertEnter",
		dependencies = {
			{
				-- snippet plugin
				"L3MON4D3/LuaSnip",
				dependencies = "rafamadriz/friendly-snippets",
				opts = { history = true, updateevents = "TextChanged,TextChangedI" },
				config = function(_, opts)
					require("luasnip").config.set_config(opts)
					require("config.luasnip")
				end,
			},

			-- autopairing of (){}[] etc
			{
				"windwp/nvim-autopairs",
				opts = {
					fast_wrap = {},
					disable_filetype = { "TelescopePrompt", "vim" },
				},
				config = function(_, opts)
					require("nvim-autopairs").setup(opts)

					-- setup cmp for autopairs
					local cmp_autopairs = require("nvim-autopairs.completion.cmp")
					require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
				end,
			},

			-- cmp sources plugins
			{
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
			},
		},
		config = function()
			require("config.cmp")
		end,
	},
	{
		"folke/trouble.nvim",
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		lazy = true,
		-- event = "VeryLazy", -- Or `LspAttach`
		event = { "BufReadPost", "BufNewFile" },
		priority = 1000, -- needs to be loaded in first
		config = function()
			require("tiny-inline-diagnostic").setup({
				hi = {},
				options = {
					multilines = true,
				},
			})
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		lazy = true,
		-- event = "VeryLazy",
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},
	{
		"stevearc/aerial.nvim",
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			on_attach = function(bufnr)
				-- Jump forwards/backwards with '{' and '}'
				vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
				vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
			end,
		},
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		lazy = true,
		event = "InsertEnter",
		opts = {},
	},
	{
		"onsails/lspkind.nvim",
		lazy = true,
		event = "InsertEnter",
		opts = {},
	},
	{
		"j-hui/fidget.nvim",
		lazy = true,
		event = "VeryLazy",
		opts = {},
	},
	{
		"kevinhwang91/nvim-bqf",
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},
	{
		"folke/lazydev.nvim",
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
