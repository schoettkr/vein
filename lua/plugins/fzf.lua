return {
  {
    "ibhagwan/fzf-lua",
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    -- opts = {
    -- defaults = {
    --   mappings = {
    --     i = {
    --       ["<C-u>"] = false,
    --       ["<C-d>"] = false,
    --     },
    --   },
    -- },
    -- },
    config = function(_, _)
      require("fzf-lua").setup({
        winopts = { row = 1, col = 0.1, border = "none", height = 0.4, width = 1 },
        keymap = {
          -- These override the default tables completely
          -- no need to set to `false` to disable a bind
          -- delete or modify is sufficient
          builtin = {
            -- neovim `:tmap` mappings for the fzf win
            ["<F1>"] = "toggle-help",
            ["<F2>"] = "toggle-fullscreen",
            -- Only valid with the 'builtin' previewer
            ["<F3>"] = "toggle-preview-wrap",
            ["<F4>"] = "toggle-preview",
            -- Rotate preview clockwise/counter-clockwise
            ["<F5>"] = "toggle-preview-ccw",
            ["<F6>"] = "toggle-preview-cw",
            ["ctrl-d"] = "preview-page-down", -- dunno these dont work, use shift-down/up
            ["ctrl-u"] = "preview-page-up",
            ["<S-left>"] = "preview-page-reset",
          },
          fzf = {
            -- fzf '--bind=' options
            ["ctrl-z"] = "abort",
            ["ctrl-x"] = "unix-line-discard",
            ["ctrl-f"] = "half-page-down",
            ["ctrl-b"] = "half-page-up",
            ["ctrl-a"] = "beginning-of-line",
            ["ctrl-e"] = "end-of-line",
            ["alt-a"] = "toggle-all",
            -- Only valid with fzf previewers (bat/cat/git/etc)
            ["f3"] = "toggle-preview-wrap",
            ["f4"] = "toggle-preview",
            ["ctrl-d"] = "preview-page-down",
            ["ctrl-u"] = "preview-page-up",
          },
        },
      })
      -- local telescope = require("telescope")
      --
      -- require("core.keybindings").telescope_builtin_mappings()

      -- local opts = {
      --   defaults = {
      --     mappings = require("core.keybindings").telescope_mappings(),
      --   },
      -- }
      -- telescope.setup(opts)
    end,
  },
}
