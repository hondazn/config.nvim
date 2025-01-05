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
---- oil
map("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

---- telescope
local telescope = require("telescope.builtin")
map("n", "<leader>ff", telescope.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", telescope.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", telescope.buffers, { desc = "Telescope buffers" })
map("n", "<leader>fh", telescope.oldfiles, { desc = "Telescope file history" })
map("n", "<leader>fc", telescope.colorscheme, { desc = "Telescope colorscheme" })
map("n", "<leader>fo", "<CMD>Telescope smart_open<CR>", { desc = "Telescope smart open" })

---- lsp-config
map("n", "<leader>ld", "<CMD>lua vim.lsp.buf.definition()<CR>", { desc = "LSP go to definition" })
map("n", "<leader>lh", "<CMD>lua vim.lsp.buf.hover()<CR>", { desc = "LSP hover" })
map("n", "<leader>lr", "<CMD>lua vim.lsp.buf.references()<CR>", { desc = "LSP references" })
map("n", "<leader>ls", "<CMD>lua vim.lsp.buf.signature_help()<CR>", { desc = "LSP signature help" })
map("n", "<leader>lf", "<CMD>lua vim.lsp.buf.formatting()<CR>", { desc = "LSP formatting" })
map("n", "<leader>la", "<CMD>lua vim.lsp.buf.code_action()<CR>", { desc = "LSP code action" })
map("n", "<leader>lw", "<CMD>lua vim.lsp.buf.workspace_symbol()<CR>", { desc = "LSP workspace symbol" })
map("n", "<leader>lD", "<CMD>lua vim.lsp.buf.declaration()<CR>", { desc = "LSP go to declaration" })
map("n", "<leader>li", "<CMD>lua vim.lsp.buf.implementation()<CR>", { desc = "LSP go to implementation" })
map("n", "<leader>lt", "<CMD>lua vim.lsp.buf.type_definition()<CR>", { desc = "LSP go to type definition" })
map("n", "<leader>lR", "<CMD>lua vim.lsp.buf.rename()<CR>", { desc = "LSP rename" })

---- formatting
map("n", "<leader>k", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "Format File" })

---- aerial
map("n", "<leader>lm", "<CMD>AerialToggle!<CR>", { desc = "Aerial: Toggle Code Map" })

---- snacks
map("n", "<leader>z", function()
	Snacks.zen()
end, { desc = "Toggle Zen Mode" })

map("n", "<leader>Z", function()
	Snacks.zen.zoom()
end, { desc = "Toggle Zoom" })

map("n", "<leader>.", function()
	Snacks.scratch()
end, { desc = "Toggle Scratch Buffer" })

map("n", "<leader>S", function()
	Snacks.scratch.select()
end, { desc = "Select Scratch Buffer" })

map("n", "<leader>n", function()
	Snacks.notifier.show_history()
end, { desc = "Notification History" })

map("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Delete Buffer" })

map("n", "<leader>cR", function()
	Snacks.rename.rename_file()
end, { desc = "Rename File" })

map({ "n", "v" }, "<leader>gB", function()
	Snacks.gitbrowse()
end, { desc = "Git Browse" })

map("n", "<leader>gb", function()
	Snacks.git.blame_line()
end, { desc = "Git Blame Line" })

map("n", "<leader>gf", function()
	Snacks.lazygit.log_file()
end, { desc = "Lazygit Current File History" })

map("n", "<leader>gg", function()
	Snacks.lazygit()
end, { desc = "Lazygit" })

map("n", "<leader>gl", function()
	Snacks.lazygit.log()
end, { desc = "Lazygit Log (cwd)" })

map("n", "<leader>un", function()
	Snacks.notifier.hide()
end, { desc = "Dismiss All Notifications" })

map("n", "<leader>tt", function()
	Snacks.terminal()
end, { desc = "Toggle Terminal" })

map({ "n", "t" }, "]]", function()
	Snacks.words.jump(vim.v.count1)
end, { desc = "Next Reference" })

map({ "n", "t" }, "[[", function()
	Snacks.words.jump(-vim.v.count1)
end, { desc = "Prev Reference" })

map("n", "<leader>N", function()
	Snacks.win({
		file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
		width = 0.6,
		height = 0.6,
		wo = {
			spell = false,
			wrap = false,
			signcolumn = "yes",
			statuscolumn = " ",
			conceallevel = 3,
		},
	})
end, { desc = "Neovim News" })

-- Enable <Tab> to indent if no suggestions are available
vim.keymap.set("i", "<Tab>", function()
	if require("copilot.suggestion").is_visible() then
		require("copilot.suggestion").accept()
	else
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
	end
end, { desc = "Super Tab", silent = true })
