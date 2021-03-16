vim.api.nvim_exec(
[[
augroup fmt
  autocmd!
  au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END
]],
false)

-- from https://github.com/sbdchd/neoformat/issues/134
