-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use({ 'wbthomason/packer.nvim' })

	use({
		'nvim-telescope/telescope.nvim',
		tag = '0.1.6',
		requires = { { 'nvim-lua/plenary.nvim' } }
	})

	use({ "catppuccin/nvim", as = "catppuccin" })

	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use('hrsh7th/nvim-cmp', {
        requires = {
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
        },
        lazy = false,
    })

	use({
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },
			{ 'neovim/nvim-lspconfig' },
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
		}
	})

	use({
		'nvim-tree/nvim-tree.lua',
		after = 'nvim-web-devicons',
		requires = 'nvim-tree/nvim-web-devicons',
	})

	use({
		'kdheepak/lazygit.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
		},
	})

	use({
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end,
	})

    use({
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    })

    use({
        "L3MON4D3/LuaSnip",
        requires = { { "rafamadriz/friendly-snippets" } },
        tag = "v2.*",
        run = "make install_jsregexp",
    })

    use({
        "saadparwaiz1/cmp_luasnip",
        requires = { { "L3MON4D3/LuaSnip" } },
    })
end)

