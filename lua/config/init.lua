vim.schedule(function()
	require("config.mappings")
	require("config.diagnostic")
	require("config.lsp")
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

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.undofile = true

g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

vim.o.clipboard = "unnamedplus"

local function paste()
  return {
    vim.fn.split(vim.fn.getreg(""), "\n"),
    vim.fn.getregtype(""),
  }
end

vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = paste,
    ["*"] = paste,
  },
}

opt.helplang = "ja"
opt.shortmess:append("sI")
opt.scrolloff = 16

-- for GUI
o.guifont = "PlemolJP Console NF:h14"
g.neovide_cursor_vfx_mode = { "sonicboom", "ripple", "torpedo", "pixiedust", "railgun" }
