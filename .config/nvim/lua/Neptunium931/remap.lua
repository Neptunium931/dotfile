local maping = require('Neptunium931.mappings')
local key = vim.keymap

key.set('n', '<leader>pv', vim.cmd.Ex)

local g = vim.g
local opt = vim.opt

g.mapleader = ' '
g.c_syntax_for_h = 1
vim.cmd('set colorcolumn=80')
opt.laststatus = 3 -- global statusline
opt.showmode = false
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2
opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"
opt.relativenumber = true
opt.number = true
opt.numberwidth = 2
opt.ruler = false
opt.shortmess:append "si"
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true
opt.updatetime = 250
g.mapleader = " "

-- disable some default providers
for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

