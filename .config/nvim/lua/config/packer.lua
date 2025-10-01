-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'preservim/nerdtree'
  use ('theprimeagen/harpoon')
  use ('mbbill/undotree')
  use ('tpope/vim-fugitive')
 
  use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
  use ('nvim-treesitter/playground')
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  use {'neoclide/coc.nvim', branch = 'release'}
  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-treesitter/nvim-treesitter"}
    }
  }

  use 'tpope/vim-surround'
  --  Press cs"' inside
  -- "Hello world!"
  -- to change it to
  -- 'Hello world!'
  --
  -- Now press cs'<q> to change it to
  -- <q>Hello world!</q>
  --
  -- To go full circle, press cst" to get
  -- "Hello world!"
  --
  -- To remove the delimiters entirely, press ds".
  -- Hello world!
  --
  -- Now with the cursor on "Hello", press ysiw] (iw is a text object).
  -- [Hello] world!
  --
  -- Let's make that braces and add some space (use } instead of { for no space): cs]{
  -- { Hello } world!
  --
  -- Now wrap the entire line in parentheses with yssb or yss).
  -- ({ Hello } world!)
  --
  -- Revert to the original text: ds{ds)
  -- Hello world!
  --
  -- Emphasize hello: ysiw<em>
  -- <em>Hello</em> world!
  --
  -- Finally, let's try out visual mode. Press a capital V (for linewise visual mode) followed by S<p class="important">.
  -- <p class="important">
  --   <em>Hello</em> world!
  -- </p>

end)
