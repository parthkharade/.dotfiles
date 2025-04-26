-- BOOTSTRAPPING
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
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here

  --------------------------------------------------------------------------------------------------------------

  use 'rktjmp/lush.nvim' -- This is for themes.
  use 'muchzill4/doubletrouble' -- DoubleTrouble Theme
  use 'nvim-tree/nvim-web-devicons' -- For fancy file icons
  use 'nvim-lualine/lualine.nvim' -- Status bar in nvim 
  use {'karb94/neoscroll.nvim',
  config = function()
    require('neoscroll').setup({mappings = {}})
    end
  }
  use 'motosir/skel-nvim' -- File Templates
  use {'nvim-telescope/telescope.nvim', tag = '0.1.6', -- For browsing files and live grep.
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  --------------------------------------------------------------------------------------------------------------

  use 'nvim-treesitter/nvim-treesitter' -- Syntax highlighting, Kinda works
  use {'neoclide/coc.nvim', branch = 'release'} -- Menu Based Completion for Nvim. Kinda Works.
  use {"williamboman/mason.nvim",
    config = function()
      require('mason').setup({})
      end
  }
  use {"williamboman/mason-lspconfig.nvim",
    config = function()
      require('mason-lspconfig').setup({})
      end
  }
  use {
    "neovim/nvim-lspconfig"
  }
  --------------------------------------------------------------------------------------------------------------

  use({'MeanderingProgrammer/render-markdown.nvim',-- Render Markdown in nvim.
    config = function()
      require('render-markdown').setup({})
    end,
  })
  use {"eoh-bse/minintro.nvim", -- Intro screen
    config = function() require("minintro").setup() end
  }
  use 'lervag/vimtex' -- For Latex Compilation and Stuff. I am mostly using overleaf for now though.
  -- use 'github/copilot.vim' -- Enable this with caution. Don't when you are learning something new!
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
