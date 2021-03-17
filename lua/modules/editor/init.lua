require("modules.editor.lsp")
require("modules.editor.gitgutters")
require("modules.editor.treesitter")
require("modules.editor.autopairs")
require("modules.editor.formatter")
-- require("modules.editor.lightbulb")

-- vim.api.nvim_exec(
-- [[
-- autocmd BufEnter *.tsx :setlocal filetype=typescriptreact,typescript
-- ]],
-- false)

-- autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

-- filetype on
-- filetype plugin indent on

-- vim.api.nvim_exec(
-- [[
-- augroup SyntaxSettings
--     autocmd!
--     autocmd BufNewFile,BufRead *.tsx set filetype=typescript
-- augroup END
-- ]],
-- false)
vim.api.nvim_exec(
[[
augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript.typescriptreact
augroup END
]],
false)

vim.api.nvim_exec(
[[
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
]],
false)
