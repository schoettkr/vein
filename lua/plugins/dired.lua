return {
  -- {
  --   "X3eRo0/dired.nvim",
  --   dependencies = { "MunifTanjim/nui.nvim" },
  --   config = function()
  --     require("dired").setup({
  --       path_separator = "/",
  --       show_banner = false,
  --       show_hidden = true,
  --       show_dot_dirs = true,
  --       show_colors = true,
  --     })
  --   end,
  -- },
  {
    "tamago324/lir.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- "kyazdani42/nvim-web-devicons",
    },
    config = function()
      local actions = require("lir.actions")
      local mark_actions = require("lir.mark.actions")
      local clipboard_actions = require("lir.clipboard.actions")
      -- https://github.com/tamago324/lir.nvim#configuration
      -- go to and comment out a.nvim_buf_set_option(0, "bufhidden", "wipe") to have the buffer stick around (using function on kbd now)
      require("lir").setup({
        show_hidden_files = false,
        ignore = {}, -- { ".DS_Store", "node_modules" } etc.
        devicons = {
          enable = false,
          highlight_dirname = true,
        },
        mappings = {
          ["<CR>"] = actions.edit,
          ["<C-s>"] = actions.split,
          ["<C-v>"] = actions.vsplit,
          ["<C-t>"] = actions.tabedit,
          ["-"] = actions.up,
          ["<BS>"] = actions.up,
          ["q"] = actions.quit,
          ["+"] = actions.mkdir,
          ["c"] = actions.newfile,
          ["R"] = actions.rename,
          ["m"] = function()
            mark_actions.toggle_mark()
            vim.cmd("normal! j")
          end,
          ["@"] = actions.cd,
          ["Y"] = actions.yank_path,
          ["."] = actions.toggle_show_hidden,
          ["D"] = actions.delete,
          ["C"] = clipboard_actions.copy,
          ["X"] = clipboard_actions.cut,
          ["P"] = clipboard_actions.paste,
        },
      })
    end,
  },
}
