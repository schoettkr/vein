-- check if packer is installed (~/local/share/nvim/site/pack)
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

local packages = {}

function packages.load()
  require("packer").startup(
    function()
      -- package manager
      use {"wbthomason/packer.nvim", opt = true}
      -- working with paths, commands, OS (dep for telescope)
      use {"nvim-lua/plenary.nvim"}
      -- api that is compatible with the vim popup_* apis (dep for telescope)
      use {"nvim-lua/popup.nvim"}
      -- icons
      use {"kyazdani42/nvim-web-devicons"}
      -- more icons! adds icons to newtr and more
      use {"ryanoasis/vim-devicons"}
      -- color themes
      use {"chriskempson/base16-vim"}
      -- file tree
      use {"kyazdani42/nvim-tree.lua"}
      -- status line
      use {"glepnir/galaxyline.nvim"}
      -- way nicer syntax highlighting
      use {"nvim-treesitter/nvim-treesitter"}
      -- highlight colors in their respective colors
      use {"norcalli/nvim-colorizer.lua"}
      -- nice dashboard on start
      use {'mhinz/vim-startify'}
      -- indendation guides
      use {'Yggdroot/indentLine'} -- maybe switch to indent-blankline ?
      -- gcc the bugs
      use { 'tpope/vim-commentary'}
      -- code formatter
      use {"sbdchd/neoformat"}
      -- common configurations for LSP
      use {"neovim/nvim-lspconfig"}
      -- autocompletion 
      use {"hrsh7th/nvim-compe"}
      -- autpairing brackets, quotes, tags etc
      use {"windwp/nvim-autopairs"}
      -- add vscode like pictograms to autocompletion dropdowns etc
      use {"onsails/lspkind-nvim"}
      -- this shouldn't be possible
      use {"tpope/vim-surround"}
      -- OP search
      use {"eugen0329/vim-esearch"}
      -- easy motion on steroids
      use {"phaazon/hop.nvim"}
      -- jump between more matching things with %
      use {"andymass/vim-matchup"}
      -- git's got your back
      use {'TimUntersberger/neogit'}
      use {"lewis6991/gitsigns.nvim"}
      -- i miss you swiper
      use {"pelodelfuego/vim-swoop"}
      -- window history
      use { 'habamax/vim-winlayout'}
      -- autoclose/complete/adapt tags
      use {"windwp/nvim-ts-autotag"}
      -- correctly comment in .tsx/.jsx
      use {"JoosepAlviste/nvim-ts-context-commentstring"}

      -- think about telescope-project, telescope-z
      
      ---------------------------
      -- Experimental  --
      ---------------------------
      -- Find, Filter, Preview, Pick. Fuzzy find all the things!
      use {"nvim-telescope/telescope.nvim"}
      -- preview media files in telescope
      use {"nvim-telescope/telescope-media-files.nvim"}

      use {'conweller/findr.vim'}
      use {"junegunn/fzf"}
      use {"junegunn/fzf.vim"}
      use {'airblade/vim-rooter'}

      ---------------------------
      -- Others | Deactivated  --
      ---------------------------

      -- analyze plugins time taken to startup .. not needed for now
      -- use {"tweekmonster/startuptime.vim"}
      
      -- Buffer/Window tab line.. not needed i think?!
      -- use {"akinsho/nvim-bufferline.lua"}
      
      -- autosave
      -- use {"907th/vim-auto-save"}
      
      -- nice but ... i see no effect?
      -- use {"kosayoda/nvim-lightbulb"}


      
      -- signature hints for autocompletion
      -- check https://www.reddit.com/r/neovim/comments/mdy1c8/function_signature_autocompletion_with_nvimcompe/ to see if still necessary
      -- use {'ray-x/lsp_signature.nvim'}
       
    end
  )
end

return packages
