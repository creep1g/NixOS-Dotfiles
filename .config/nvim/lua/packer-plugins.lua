local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins

  -- NIO	
  use 'nvim-neotest/nvim-nio'
  -- lspkind
  use 'onsails/lspkind.nvim'

  -- colorscheme
  use {'AlphaTechnolog/pywal.nvim', as = 'pywal'}
	
  -- alignment
  use 'Vonr/align.nvim'

  -- treesitter
  use 'nvim-treesitter/nvim-treesitter'

  -- Telescore
  use 'nvim-telescope/telescope.nvim'

  -- DADBOD
  use 'tpope/vim-dadbod'
  
  use 'kristijanhusak/vim-dadbod-ui'

  -- Fold code lines
  use{ 'anuvyklack/pretty-fold.nvim',
   config = function()
      require('pretty-fold').setup()
   end
}
--  use{'manzeloth/live-server'}
  use{'barrett-ruth/live-server.nvim'}
  --,
    --    build = 'pnpm add -g live-server',
      --  cmd = {'LiveServerStart', 'LiveServerStop'}
        --config = true
      --}

  -- Colors Hightlight
  use {'norcalli/nvim-colorizer.lua',
   config = function()
		require('colorizer').setup()
	end
  }
 -- Auto pair
   use { 'windwp/nvim-autopairs',
   config = function()
   	require('nvim-autopairs').setup()
  end}
	
  use 'turbio/bracey.vim'
  use {'nvim-tree/nvim-web-devicons'}
 -- NvimTree
  use {
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons" ,
    wants = "nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup()

      require("nvim-tree").setup {
        hijack_cursor = true,
        view = {
          width = 40
        }
      }
    end
  }
  -- Startup screen, will try to personalize this more later  
  use {
  "startup-nvim/startup.nvim",
  requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
  config = function()
    require"startup".setup { theme = "dashboard" }
  end
}
-- autotag
 use {'windwp/nvim-ts-autotag'}
 -- Vim comentary 
 use {'terrortylor/nvim-comment',
	config = function()
		require('nvim_comment').setup()
	end
 }

 --HEX
  use {'rrethy/vim-hexokinase', run = 'make hexokinase'}
 -- GO
  use {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}

 use {'ray-x/go.nvim',
	conifg = function()
		require('go').setup()
	end
 }
 -- Language server
 use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
	}

  -- Auto completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  -- snippets
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-vsnip'

  -- debug
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'

  -- cpp formatting
  use 'jose-elias-alvarez/null-ls.nvim'

  --git
  use 'tpope/vim-fugitive'

  -- Comfy motions
  use 'yuttie/comfortable-motion.vim'

  -- rainbow paranthesese
  use {'HiPhish/nvim-ts-rainbow2'}

  use 'junegunn/fzf'

  -- Omnisharp
  use 'OmniSharp/omnisharp-vim'

  --Lualine
  --
  use {
	'nvim-lualine/lualine.nvim',
	requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Notify
  use {
	"rcarriga/nvim-notify",
    config = function()
           vim.notify = require "notify"
    end
    }
  -- Gitsign
  use {
  'lewis6991/gitsigns.nvim',
   -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
 }
  use {
   'weilbith/nvim-code-action-menu',
   cmd = 'CodeActionMenu',
 }
end)


