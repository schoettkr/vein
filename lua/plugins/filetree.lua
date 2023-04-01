return {
  {
    'lambdalisue/fern.vim',
    config = function()
      require('core.keybindings').filetree_mappings()
    end
  },
  {
    'luukvbaal/nnn.nvim',
    config = function()
      require("nnn").setup()
    end
  }
}
