-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use { "ellisonleao/gruvbox.nvim" }

  use({
      'rose-pine/neovim',
      as = 'rose-pine',
      config = function()
    	  vim.cmd('colorscheme rose-pine')
      end
  })

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
  use ('nvim-treesitter/playground')
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use ('theprimeagen/harpoon')
  use ('mbbill/undotree')
  use ('tpope/vim-fugitive')

  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'preservim/nerdtree'
  -- use 'junegunn/goyo.vim'
  -- use 'jreybert/vimagit'
  -- use 'vimwiki/vimwiki'
  -- use 'vim-airline/vim-airline'
  -- use 'ap/vim-css-color'
 
  use {'neoclide/coc.nvim', branch = 'release'}
  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-treesitter/nvim-treesitter"}
    }
}
end)
