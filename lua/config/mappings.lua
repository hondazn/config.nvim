local map = vim.keymap.set

-- vim keymap
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")
map("i", "<C-h>", "<BS>")
map("i", "<C-d>", "<Del>")
map("i", "<C-f>", "<Right>")
map("i", "<C-b>", "<Left>")
map("i", "<C-n>", "<Down>")
map("i", "<C-p>", "<Up>")
map("i", "<C-a>", "<Home>")
map("i", "<C-e>", "<End>")
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
map("n", "<leader>/", "gcc", { desc = "Comment line", remap = true })
map("v", "<leader>/", "gc", { desc = "Comment line", remap = true })

-- plugins keymap
---- oil
map("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

---- bufferline
map("n", "<C-t>", "<CMD>BufferPrevious<CR>", { desc = "prev buffer" })
map("n", "<C-S-t>", "<CMD>BufferNext<CR>", { desc = "next buffer" })
map("n", "<leader>bd", "<CMD>BufferClose<CR>", { desc = "delete current buffer" })
map("n", "<leader>bo", "<CMD>BufferCloseAllButCurrentOrPinned<CR>", { desc = "Close every buffer except pinned buffers or the current buffer" })

---- telescope
map("n", "<C-S-p>", "<CMD>Telescope commands<CR>", { desc = "Telescope commands" })
map("n", "<leader>fc", "<CMD>Telescope commands<CR>", { desc = "Telescope commands" })
map("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Telescope find files" })
map("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", { desc = "Telescope live grep" })
map("n", "<leader>fb", "<CMD>Telescope buffers<CR>", { desc = "Telescope buffers" })
map("n", "<leader>fh", "<CMD>Telescope oldfiles<CR>", { desc = "Telescope file history" })
map("n", "<leader>ft", "<CMD>Telescope colorscheme<CR>", { desc = "Telescope colorscheme theme" })
map("n", "<leader>fo", "<CMD>Telescope smart_open<CR>", { desc = "Telescope smart open" })

---- noice
map("n", "<leader>nh", "<CMD>Noice history<CR>", { desc = "Noice" })
map("n", "<leader>nn", "<CMD>Noice dismiss<CR>", { desc = "Noice" })

---- luasnip
map("i", "<C-k>", function() require("luasnip").expand() end, { desc = "Luasnip expand or jump" })

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

---- octo
map("n", "<leader>ghi", "<CMD>Octo issue list<CR>", { desc = "Octo: Issue List" })
map("n", "<leader>ghp", "<CMD>Octo pr list<CR>", { desc = "Octo: PullRequest List" })
map("n", "<leader>ghc", "<CMD>Octo comment add<CR>", { desc = "Octo: Comment Add" })
map("n", "<leader>ghn", "<CMD>Octo issue create<CR>", { desc = "Octo: Issue Create" })

---- obsidian
-- map("n", "<leader>oo", "<CMD>ObsidianOpen<CR>", { desc = "Obsidian: Open" })
-- map("n", "<leader>oy", "<CMD>ObsidianYesterday<CR>", { desc = "Obsidian: Open" })
-- map("n", "<leader>od", "<CMD>ObsidianToday<CR>", { desc = "Obsidian: Open" })
-- map("n", "<leader>ot", "<CMD>ObsidianTomorrow<CR>", { desc = "Obsidian: Open" })
-- map("n", "<C-t>", "<CMD>ObsidianToggleCheckbox<CR>", { desc = "Obsidian: Open" })

---- snacks
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
