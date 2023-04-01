return {
  -- Please god prevent me from switching themes
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    opts = {
      --      style = 'cool',
      transparent = true,
    },
    config = function(_, opts)
      local onedark = require("onedark")
      onedark.setup(opts)
      onedark.load()
    end,
  },
  {
    -- Set lualine as statusline
    "nvim-lualine/lualine.nvim",
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = "onedark",
        component_separators = "|",
        section_separators = "",
      },
    },
  },

  {
    -- Add indentation guides even on blank lines
    "lukas-reineke/indent-blankline.nvim",
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = "┊",
      show_trailing_blankline_indent = false,
    },
  },
}
