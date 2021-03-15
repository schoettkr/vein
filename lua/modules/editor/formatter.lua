vim.api.nvim_exec(
[[
augroup fmt
  autocmd BufWritePre * undojoin | Neoformat
augroup END
]],
false)
