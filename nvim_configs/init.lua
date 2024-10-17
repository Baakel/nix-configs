--- This sets the leader to space, MUST happen before any plugns load to inherit
vim.g.mapleader = ' '
vim.g.maploalleader = ' '


--- This installs lazy plugin manager. It declares a local var called lazypath, apparently it appends it to the standard path called 'data'
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

--- Plugins go here, you can add extra config to them with the config key
require('lazy').setup({
  -- This is the git wrapper that is suppossed to be mega cool?
  'tpope/vim-fugitive',
  -- Adds stuff to fugitive
  'tpope/vim-rhubarb',
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  {
    'sainhe/gruvbox-material',
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_foreground = 'mix'
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_better_performance = 1
      vim.cmd.colorscheme 'gruvbox-material'
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = true,
	theme = 'gruvbox-material',
      },
    },
  },

}, {})

-- set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true

-- Sync clipboard between OS and Neovim.
-- In theory this should work, but is funky
-- See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time (Make vim more responsive)
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: check that your terminal supports this
vim.o.termguicolors = true

