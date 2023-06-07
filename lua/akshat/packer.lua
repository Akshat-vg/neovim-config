-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use ({ "catppuccin/nvim",
  	as = "catppuccin",
	config = function()
		vim.cmd('colorscheme catppuccin')
  	end
      })

  use ('nvim-treesitter/nvim-treesitter',
      {run = ':TSUpdate'},
      require'nvim-treesitter.configs'.setup {
          autotag = {
              enable = true,
              filetypes = { "html" , "xml" ,"rust"  },
          }
      }
  )
  use ('nvim-treesitter/playground')
  use ('nvim-lua/plenary.nvim')
  use ('ThePrimeagen/harpoon')
  use ('mbbill/undotree')
  use ('tpope/vim-fugitive')
  use ('tpope/vim-commentary')
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
  end}
  use {
      'goolord/alpha-nvim',
      requires = { 'nvim-tree/nvim-web-devicons' },
      config = function ()
          require'alpha'.setup(require'alpha.themes.dashboard'.config)
      end
  }
  use ('nvim-lua/popup.nvim');
  use ('nvim-tree/nvim-tree.lua');
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use ('ThePrimeagen/vim-be-good');
  use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }
  use {
          'VonHeikemen/lsp-zero.nvim',
          branch = 'v2.x',
          requires = {
              -- LSP Support
              {'neovim/nvim-lspconfig'},             -- Required
              {                                      -- Optional
              'williamboman/mason.nvim',
              run = function()
                  pcall(vim.cmd, 'MasonUpdate')
              end,
          },
          {'williamboman/mason-lspconfig.nvim'}, -- Optional

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},     -- Required
          {'hrsh7th/cmp-nvim-lsp'}, -- Required
          {'L3MON4D3/LuaSnip'},     -- Required
      }
    }


end)


