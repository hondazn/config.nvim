local map = vim.keymap.set

-- vim keymap
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")
map("i", "<C-h>", "<BS>")
map("i", "<C-d>", "<Del>")
map("i", "<C-f>", "<Right>")
map("i", "<C-b>", "<Left>")
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

-- plugins keymap
map("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

local telescope = require("telescope.builtin")
map("n", "<leader>ff", telescope.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", telescope.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", telescope.buffers, { desc = "Telescope buffers" })
map("n", "<leader>fh", telescope.help_tags, { desc = "Telescope help tags" })
map("n", "<leader>fo", "<CMD>Telescope smart_open<CR>", { desc = "Telescope smart open" })

-- aerial
map("n", "<leader>lm", "<CMD>AerialToggle!<CR>", { desc = "Aerial: Toggle Code Map"})

-- formatting
map("n", "<leader>k", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "Format File" })

-- open lazygit
map("n", "<leader>g", function()
	require("toggleterm.terminal").Terminal
		:new({
			cmd = "lazygit",
			direction = "float",
			float_opts = {
				width = vim.o.columns - 10,
				height = vim.o.lines - 6,
			},
			hidden = true,
		})
		:toggle()
end, { noremap = true, silent = true })
