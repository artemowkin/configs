return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use 'nvim-lua/plenary.nvim'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/nvim-cmp'
	use 'onsails/lspkind-nvim'
    use 'p00f/alabaster.nvim'

    use {
        'zenbones-theme/zenbones.nvim',
        requires = { 'rktjmp/lush.nvim' }
    }

    use {
        "stevearc/conform.nvim",
        config = function()
              require("conform").setup()
        end,
    }

	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}

	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }

	use {
		'nvim-tree/nvim-web-devicons',
		config = function()
			require('nvim-web-devicons').setup({ default = true; })
		end
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	use {
		'olexsmir/gopher.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-treesitter/nvim-treesitter',
		},
	}

	use {
	  'L3MON4D3/LuaSnip',
	  after = 'friendly-snippets',
	  config = function()
	    require('luasnip/loaders/from_vscode').load({
	     paths = { '~/.local/share/nvim/site/pack/packer/start/friendly-snippets' }
	    })
	  end
	}

	use 'saadparwaiz1/cmp_luasnip'
	use 'rafamadriz/friendly-snippets'

	if packer_bootstrap then
		require('packer').sync()
	end
end)
