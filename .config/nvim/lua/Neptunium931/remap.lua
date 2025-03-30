local key = vim.keymap
local g = vim.g
local opt = vim.opt

key.set('n', '<leader>pv', vim.cmd.Ex)
key.set('n', '<S-q>', function () vim.cmd('bdelete') end)
key.set('n', '<leader>lv', function() vim.cmd('VimtexView')    end)
key.set('n', '<leader>ll', function() vim.cmd('VimtexCompile') end)

-- refactoring.nvim
key.set('x', '<leader>re', function() require('refactoring').refactor('Extract Function') end)
key.set('x', '<leader>rf', function() require('refactoring').refactor('Extract Function To File') end)
key.set('x', '<leader>rv', function() require('refactoring').refactor('Extract Variable') end)
key.set('n', '<leader>rI', function() require('refactoring').refactor('Inline Function') end)
key.set({ 'n', 'x' }, '<leader>ri', function() require('refactoring').refactor('Inline Variable') end)
key.set('n', '<leader>rb', function() require('refactoring').refactor('Extract Block') end)
key.set('n', '<leader>rbf', function() require('refactoring').refactor('Extract Block To File') end)

key.set('n', '<leader>m', ':make<CR><CR>:cw<CR>:.cc<CR>')
key.set('n', '<leader>qn', ':cn<CR>')
key.set('n', '<leader>qp', ':cp<CR>')

key.set('n', '<leader>/', function() require('Comment.api').toggle.linewise.current() end)
key.set('v', '<leader>/', '<ESC><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')


key.set('n','<Esc>',  ':noh <CR>')

-- resize windows with arrows
key.set('n', '<C-Up>' ,  ':resize -2<CR>')
key.set('n', '<C-Down>' ,  ':resize +2<CR>')
key.set('n', '<C-Left>' ,  ':vertical resize -2<CR>')
key.set('n', '<C-Right>' ,  ':vertical resize +2<CR>')

g.mapleader = ' '
g.c_syntax_for_h = 1
vim.cmd('set colorcolumn=80')
opt.laststatus = 3 -- global statusline
opt.showmode = false
opt.clipboard = 'unnamedplus'
opt.cursorline = true
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2
opt.fillchars = { eob = ' ' }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = 'a'
opt.relativenumber = true
opt.number = true
opt.numberwidth = 2
opt.ruler = false
opt.shortmess:append 'si'
opt.signcolumn = 'yes'
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true
opt.updatetime = 250
g.mapleader = ' '

-- disable some default providers
for _, provider in ipairs { 'node', 'perl', 'python3', 'ruby' } do
  vim.g['loaded_' .. provider .. '_provider'] = 0
end

