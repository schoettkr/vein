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
      use {'Yggdroot/indentLine'}
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
      -- autoclose/complete open html tags
      use {"alvan/vim-closetag"}
      -- add vscode like pictograms to autocompletion dropdowns etc
      use {"onsails/lspkind-nvim"}
      -- this shouldn't be possible
      use {"tpope/vim-surround"}
      -- Find, Filter, Preview, Pick. Fuzzy find all the things!
      use {"nvim-telescope/telescope.nvim"}
      -- preview media files in telescope
      use {"nvim-telescope/telescope-media-files.nvim"}
      -- OP search
      use {"eugen0329/vim-esearch"}
      -- easy motion on steroids
      use {"phaazon/hop.nvim"}

      -- git's got your back
      use {'TimUntersberger/neogit'}
      use {"lewis6991/gitsigns.nvim"}

      -- automatically adapt closing tags
      use {"AndrewRadev/tagalong.vim"}
      
      -- i miss you swiper
      use {"pelodelfuego/vim-swoop"}

      -- window history (seems to not work)
      use { 'habamax/vim-winlayout'}

      -- think about telescope-project, telescope-z
      
      -------------
      -- Others  --
      -------------

      -- analyze plugins time taken to startup .. not needed for now
      -- use {"tweekmonster/startuptime.vim"}
      
      -- Buffer/Window tab line.. not needed i think?!
      -- use {"akinsho/nvim-bufferline.lua"}
      
      -- autosave
      -- use {"907th/vim-auto-save"}
      
      -- nice but ... i see no effect?
      -- use {"kosayoda/nvim-lightbulb"}
      -- use {"andymass/vim-matchup"}
       
    end
  )
end

return packages
