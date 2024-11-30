-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
    use {
    "dustinblackman/oatmeal.nvim",
    config = function()
        require("oatmeal").setup({
            backend = "ollama",
            model = "llama2:latest",
        })
    end
}
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
    use ({'catppuccin/nvim' ,as = 'catppuccin',
    config = function ()
        vim.cmd('colorscheme catppuccin-mocha')
    end})
	--use({ 
	--	'rose-pine/neovim', as = 'rose-pine',
	--	config = function()
	--		vim.cmd('colorscheme rose-pine')
	--	end
	--})
    use{'nvim-lualine/lualine.nvim',
    requires={'nvim-tree/nvim-web-devicons',opt=true},
    config = function ()
        require('lualine').setup({
            options={
                theme='dracula'
            }
        })
    end}
    use {
    "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      },
      config = function()
          require('neo-tree').setup({
             filesystem = {
                filtered_items = {
                  visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
                  hide_dotfiles = false,
                  hide_gitignored = true,
                }}
          })
      end
    }

	use('nvim-treesitter/nvim-treesitter', {run=':TSUpdate'})
	use('nvim-treesitter/playground')
	use('theprimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}
end)
