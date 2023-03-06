return {
  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                              , branch = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      }
    },
    config = function (_, _)
      local telescope = require "telescope"

      local opts = {
        defaults = {
          mappings = require('core.keybindings').telescope_mappings(),
        }
      }
      telescope.setup(opts)

    end
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
    config = function(telescope)
      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')
    end
  },
}
