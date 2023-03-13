return {
  { 'lambdalisue/fern.vim',
    config = function()
      require('core.keybindings').filetree_mappings()
    end
  },
}
