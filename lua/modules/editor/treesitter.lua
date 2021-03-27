local config = require("nvim-treesitter.configs")

config.setup {
    ensure_installed = "all",
    ignore_install = { "haskell", "lua" },
    highlight = {
        enable = true,
        use_languagetree = true
    },
    context_commentstring = {
      enable = true
    }
}

require('nvim-ts-autotag').setup()
