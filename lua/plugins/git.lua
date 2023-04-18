return {
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "tpope/vim-fugitive"
  },
  {
    "TimUntersberger/neogit",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      integrations = {
        -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `sindrets/diffview.nvim`.
        -- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
        --
        -- Requires you to have `sindrets/diffview.nvim` installed.
        -- use {
        --   'TimUntersberger/neogit',
        --   requires = {
        --     'nvim-lua/plenary.nvim',
        --     'sindrets/diffview.nvim'
        --   }
        -- }
        --
        diffview = true,
      },
    },
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  }
}
