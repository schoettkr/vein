return {
  -- { "folke/which-key.nvim",  opts = {} },

  -- Detect tabstop and shiftwidth automatically
  { "tpope/vim-sleuth" },

  -- Comment things
  { "numToStr/Comment.nvim", opts = {} },

  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
}
