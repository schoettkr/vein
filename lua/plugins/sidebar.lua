return {
  {
    "sidebar-nvim/sidebar.nvim",
    opts = {
      open = true,
      section_separator = { " ", " " },
      sections = {
        "datetime",
        "files",
        "git",
        -- "diagnostics",
        -- "todos",
        -- "containers",
        "buffers"
      },
    },
  },
}
