return {
  -- { "folke/which-key.nvim",  opts = {} },

  -- Detect tabstop and shiftwidth automatically
  { "tpope/vim-sleuth" },

  -- Comment things
  { 'numToStr/Comment.nvim', opts = {} },
  
  {'windwp/nvim-autopairs',
    config = function() require("nvim-autopairs").setup {} end
  }
}
