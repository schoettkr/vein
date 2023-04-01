return {
  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    -- or                              , branch = '0.1.1',
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
          },
        },
      },
    },
    config = function(_, _)
      local telescope = require("telescope")

      require("core.keybindings").telescope_builtin_mappings()

      local opts = {
        defaults = {
          mappings = require("core.keybindings").telescope_mappings(),
        },
      }
      telescope.setup(opts)
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = "make",
    cond = function()
      return vim.fn.executable("make") == 1
    end,
    config = function(telescope)
      -- Enable telescope fzf native, if installed
      pcall(require("telescope").load_extension, "fzf")
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
              ["i"] = {
                -- your custom insert mode mappings
              },
              ["n"] = {
                -- your custom normal mode mappings
              },
            },
          },
        },
      })
      pcall(require("telescope").load_extension("file_browser"))
    end,
  },
  -- use zellij/tmux for this
  -- {
  --   'nvim-telescope/telescope-project.nvim' ,
  --   config = function()
  --     pcall(require("telescope").load_extension "project")
  --   end
  -- }
}
