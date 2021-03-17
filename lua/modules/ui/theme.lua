local cmd = vim.cmd

cmd "set background=dark"
cmd "set termguicolors"
cmd "colorscheme base16-onedark"
cmd "syntax enable"
cmd "syntax on"
-- Too keep terminal bg color, uncomment below
-- vim.cmd "hi Normal guibg=#0a0a0"

-- highlights
cmd("hi Normal guibg=#32374d")
cmd("hi LineNr guibg=NONE")
cmd("hi SignColumn guibg=NONE")
cmd("hi VertSplit guibg=NONE")
cmd("hi EndOfBuffer guifg=#282c34")

-- telescope highlights
cmd("highlight TelescopeBorder   guifg=#3e4451")
cmd("highlight TelescopePromptBorder   guifg=#3e4451")
cmd("highlight TelescopeResultsBorder  guifg=#3e4451")
cmd("highlight TelescopePreviewBorder  guifg=#525865")

-- completion dropdown highlights
cmd("highlight Pmenu guibg=#292d3e")
cmd("highlight PmenuSel guibg=#61acbb guifg=#fdf4c1")

-- tree folder name , icon color
cmd("highlight NvimTreeFolderIcon guifg = #61afef")
cmd("highlight NvimTreeFolderName guifg = #61afef")


-- neogit highlights
cmd("hi def NeogitDiffAdd guibg=#324C51 guifg=#00d188")
cmd("hi def NeogitDiffAddHighlight guibg=#008758 guifg=#fdf4c1")

cmd("hi def NeogitDiffDelete guibg=#ab4060 guifg=#87003f")
cmd("hi def NeogitDiffDeleteHighlight guibg=#c9005e guifg=#fdf4c1")

cmd("hi def NeogitDiffContextHighlight ctermbg=4 guibg=#32374d")
cmd("hi def NeogitHunkHeader guifg=#d0d0d0 guibg=#263854")
cmd("hi def NeogitHunkHeaderHighlight guifg=#FDF4C1 guibg=#61ACBB")




-- lsp-highlights
cmd("hi def LspDiagnosticsDefaultError guifg=#455a64")
-- Below line has no effect, it should deactivate the underline of errors
-- cmd("hi def LspDiagnosticsUnderlineError guifg=NONE ctermfg=NONE cterm=NONE gui=NONE")

