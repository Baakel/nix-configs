--- This sets the leader to space, MUST happen before any plugns load to inherit
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


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
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 2 } },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    },
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
      indent = {
        char = '┊',
      },
      whitespace = {
        remove_blankline_trail = false,
      },
    },
  },

  --- LSP plugins, config below. (lspconfig)
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP (The thing at the bottom right)
      -- `opts = {}` is the same as `require('sth').setup({})`
      -- Keep the legacy tag to disable warning, but also check from time to time to see if updated already
      { 'j-hui/fidget.nvim', tag = "legacy", opts = {} },

      {
        'folke/lazydev.nvim',
      },
    },
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },

  -- The one that shows the keybinds that can be used
  { 'folke/which-key.nvim', opts = {} },

  -- Add git related stuff to the gutter
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      -- We have these set up but lets try the defaults first
      -- signs = {
      --   add = { text = '+' },
      --   change = { text = '~' },
      --   delete = { text = '_' },
      --   topdelete = { text = '‾' },
      --   changedelete = { text = '~' },
      -- },
    },
  },
  
  -- Better bindings for gc commenting stuff
  { 'numToStr/Comment.nvim', opts = {} },

  { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },

  { 'windwp/nvim-autopairs', opts = {} },
  { import = 'custom.plugins' },

}, {})

-- set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true

-- This enables mouse use on nvim but might want to turn off
-- vim.o.mouse = 'a'

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

-- [[ Basic Keymaps ]]
-- I think this one disables space in normal and visual mode (the jump char part)
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- This centers the cursor with zz when you do a page down
vim.keymap.set('n', '<C-d>', '<C-d>zz')
-- Same for page up
vim.keymap.set('n', '<C-u>', '<C-u>zz')
-- Recenters after jumping to next find and keeps visual selection
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'k'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')


