return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    build = ":TSUpdate",
    event = "BufReadPost",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "bash",
          "help",
          "html",
          "javascript",
          "java",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "query",
          "regex",
          "rust",
          "tsx",
          "typescript",
          "vim",
          "yaml",
        },
        highlight = { enable = true },
        indent = { enable = true, disable = { "python" } },
	textobjects = require('core.keybindings').treesitter_textobject_mappings(),
	incremental_selection =  require('core.keybindings').treesitter_incselection_mappings(),
      }
    end,
  },
}

