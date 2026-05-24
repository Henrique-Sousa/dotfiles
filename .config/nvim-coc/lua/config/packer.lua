-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Packer can manage itself

  use "vague2k/vague.nvim" -- color theme

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'preservim/nerdtree'
  -- use ('theprimeagen/harpoon')
  use ('mbbill/undotree')
  use ('tpope/vim-fugitive') -- git
 
  use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
  use ('nvim-treesitter/playground')
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- LSP and refactoring
  use {'neoclide/coc.nvim', branch = 'release'}
  -- use {'puremourning/vimspector'}
  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-treesitter/nvim-treesitter"}
    }
  }

  use 'tpope/vim-surround'

end)
