require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'neovim/nvim-lspconfig'
	use 'williamboman/mason.nvim'
      	use 'williamboman/mason-lspconfig.nvim'
	use 'j-hui/fidget.nvim'
	use 'folke/neodev.nvim'
    	use 'hrsh7th/nvim-cmp'
    	use 'hrsh7th/cmp-nvim-lsp'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true})
		end,
	}
    use 'nvim-tree/nvim-web-devicons'
    use 'lewis6991/gitsigns.nvim'
	use 'nvim-lualine/lualine.nvim'
	use 'nvim-telescope/telescope.nvim'
    use 'nvim-tree/nvim-tree.lua'
	use 'nvim-lua/plenary.nvim'
	use 'sbdchd/neoformat'
    use 'akinsho/toggleterm.nvim'
    use 'xiyaowong/nvim-transparent'
	use 'rose-pine/neovim'
end)
