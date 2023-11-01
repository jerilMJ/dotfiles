local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	-- Git related plugins
	{'tpope/vim-fugitive'},
	{'tpope/vim-rhubarb'},
	-- Undo history and edit
	{'mbbill/undotree'},
	-- Fuzzy Finder
	{
		'nvim-telescope/telescope.nvim', branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
	-- Theme
	{
		'rebelot/kanagawa.nvim',
		priority = 1000,
		config = function()
			vim.cmd.colorscheme 'kanagawa'
		end,
	},
	-- Syntax highlighter & token parser
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
		build = ':TSUpdate',
	},
	-- Useful plugin to show you pending keybinds.
	{ 'folke/which-key.nvim', opts = {} },
	-- LSP
	{
		-- LSP Configuration & Plugins
		'neovim/nvim-lspconfig',
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			-- Useful status updates for LSP
			{ 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
			-- Additional lua configuration, makes nvim stuff amazing!
			'folke/neodev.nvim',
		},
	},
	{
		-- Autocompletion
		'hrsh7th/nvim-cmp',
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			-- Adds LSP completion capabilities
			'hrsh7th/cmp-nvim-lsp',
			-- Adds a number of user-friendly snippets
			'rafamadriz/friendly-snippets',
		},
	},
	-- Java LSP
	{'mfussenegger/nvim-jdtls'},
    -- Python black formatter
    {'psf/black'},
}, {})

