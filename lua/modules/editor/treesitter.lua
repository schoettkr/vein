local config = require("nvim-treesitter.configs")

-- Use TSInstall to seperatly install stuff
-- For installing 'all', npm i tree-sitter-cli might be required, but can be uninstalled afterwards
config.setup {
    ensure_installed = "all",
    -- ignore_install = { "haskell", "lua" },
    highlight = {
        enable = true,
        use_languagetree = true
    },
    context_commentstring = {
      enable = true
    }
}

require('nvim-ts-autotag').setup()
