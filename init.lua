require 'plugins'

-- probably will move this stuff out but for now setup our treesitter

local g = vim.g
local opt = vim.o
local cmd = vim.cmd
local wo = vim.wo

cmd('colorscheme duskfox')
opt.termguicolors = true            -- True color support

opt.expandtab = true
opt.hidden = true
opt.ignorecase = true
opt.joinspaces = true
opt.relativenumber = true
opt.number = true
opt.scrolloff = 4                   -- Lines of context
opt.shiftround = true               -- Round indent
opt.shiftwidth = 4                  -- Size of an indent
opt.sidescrolloff = 8               -- Columns of context
opt.smartcase = true                -- Do not ignore case with capitals
opt.smartindent = true              -- Insert indents automatically
opt.splitbelow = true               -- Put new windows below current
opt.splitright = true               -- Put new windows right of current
opt.tabstop = 4                     -- Number of spaces tabs count for
-- opt.wildmode = {'list', 'longest'}  -- Command-line completion mode
wo.wrap = false 

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ' '

map('n', '<C-l>', '<cmd>noh<CR>')    -- Clear highlights
map('v', '>', '>gv')
map('v', '<', '<gv')

map('n', '<leader>v', ':CHADopen<CR>')

map('n', '<leader>t', ':FloatermToggle<CR>')
map('t', '<C-\\><C-x>', '<C-\\><C-n>:FloatermToggle<CR>')

-- do keymaps here
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require 'lsp'
require 'dap_conf'
