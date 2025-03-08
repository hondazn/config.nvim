vim.schedule(function()
	require("config.mappings")
end)

local opt = vim.opt
local o = vim.o
local g = vim.g

o.swapfile = false
o.clipboard = "unnamedplus"
o.laststatus = 3
o.cursorlineopt = "number"
o.cursorline = true

-- Indenting
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.smartindent = true

o.ignorecase = true
o.smartcase = true
o.mouse = "a"

o.number = true
o.numberwidth = 2

opt.shortmess:append("sI")

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.undofile = true

g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

opt.helplang = 'ja'
