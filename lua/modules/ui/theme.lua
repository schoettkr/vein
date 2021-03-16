local cmd = vim.cmd

cmd "set background=dark"
cmd "set termguicolors"
cmd "colorscheme base16-onedark"
cmd "syntax enable"
cmd "syntax on"
-- Too keep terminal bg color, uncomment below
-- vim.cmd "hi Normal guibg=#0a0a0"

-- highlights
cmd("hi Normal guibg=#292C3E")
cmd("hi LineNr guibg=NONE")
cmd("hi SignColumn guibg=NONE")
cmd("hi VertSplit guibg=NONE")
-- cmd("highlight DiffAdd guifg=#81A1C1 guibg = none")
-- cmd("highlight DiffChange guifg =#3A3E44 guibg = none")
-- cmd("highlight DiffModified guifg = #81A1C1 guibg = none")
cmd("hi EndOfBuffer guifg=#282c34")

cmd("highlight TelescopeBorder   guifg=#3e4451")
cmd("highlight TelescopePromptBorder   guifg=#3e4451")
cmd("highlight TelescopeResultsBorder  guifg=#3e4451")
cmd("highlight TelescopePreviewBorder  guifg=#525865")
cmd("highlight PmenuSel  guibg=#98c379")

-- tree folder name , icon color
cmd("highlight NvimTreeFolderIcon guifg = #61afef")
cmd("highlight NvimTreeFolderName guifg = #61afef")
