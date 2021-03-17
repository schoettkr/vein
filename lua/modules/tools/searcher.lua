-- vim.cmd [[packadd vim-esearch.viml]]
-- vim.g.esearch.default_mappings = 0
-- require("esearch")
vim.api.nvim_exec([[
  if !exists('g:esearch') | let g:esearch = {} | endif
  let g:esearch.default_mappings = 0

]], false)



-- FLoating window
-- let g:esearch.win_new = {esearch -> esearch#buf#goto_or_open(esearch.name, {name -> nvim_open_win(bufadd(name), v:true, { 'relative': 'editor', 'row': &lines / 10, 'col': &columns / 10, 'width': &columns * 8 / 10, 'height': &lines * 8 / 10 }) }) }
-- autocmd User esearch_win_config autocmd BufLeave <buffer> quit


vim.api.nvim_exec("let g:esearch.win_map = extend([ ['n',  'R',    '<plug>(esearch-win-reload)',           ], ['n',  't',    '<plug>(esearch-win-tabopen)',          ], ['n',  'T',    '<plug>(esearch-win-tabopen:stay)',     ], ['n',  'o',    '<plug>(esearch-win-split)',            ], ['n',  'O',    '<plug>(esearch-win-split:reuse:stay)', ], ['n',  's',    '<plug>(esearch-win-vsplit)',           ], ['n',  'S',    '<plug>(esearch-win-vsplit:reuse:stay)',], ['n',  '<cr>', '<plug>(esearch-win-open)',             ], ['n',  'p',    '<plug>(esearch-win-preview)',          ], ['n',  'P',    '100<plug>(esearch-win-preview:enter)', ], ['n',  '<esc>','<plug>(esearch-win-preview:close)',    ], [' ',  'J',    '<plug>(esearch-win-jump:entry:down)'   ], [' ',  'K',    '<plug>(esearch-win-jump:entry:up)'     ], [' ',  '}',    '<plug>(esearch-win-jump:filename:down)'], [' ',  '{',    '<plug>(esearch-win-jump:filename:up)'  ], [' ',  ')',    '<plug>(esearch-win-jump:dirname:down)' ], [' ',  '(',    '<plug>(esearch-win-jump:dirname:up)'   ], ['ov', 'im',   '<plug>(textobj-esearch-match-i)',      ], ['ov', 'am',   '<plug>(textobj-esearch-match-a)',      ], ['ic', '<cr>', '<plug>(esearch-cr)', {'nowait': 1}     ], ['n',  'I',    '<plug>(esearch-I)'                     ], ['x',  'x',    '<plug>(esearch-d)'                     ], ['nx', 'd',    '<plug>(esearch-d)'                     ], ['n',  'dd',   '<plug>(esearch-dd)'                    ], ['nx', 'c',    '<plug>(esearch-c)'                     ], ['n',  'cc',   '<plug>(esearch-cc)'                    ], ['nx', 'C',    '<plug>(esearch-C)'                     ], ['nx', 'D',    '<plug>(esearch-D)'                     ], ['x',  's',    '<plug>(esearch-c)'                     ], ['n',  '.',    '<plug>(esearch-.)'                     ], ['n',  '@:',   '<plug>(esearch-@:)'                    ], ['n', 'za',    '<plug>(esearch-za)'                    ], ['n', 'zc',    '<plug>(esearch-zc)'                    ], ['n', 'zM',    '<plug>(esearch-zM)'                    ], ], get(g:esearch, 'win_map', []))", false)


vim.api.nvim_exec("let g:defaultWinSwoopHeight = 7", false)
vim.api.nvim_exec("let g:swoopIgnoreCase = 1", false)
vim.api.nvim_exec("let g:swoopAutoInsertMode = 1", false)
vim.api.nvim_exec("let g:swoopUseDefaultKeyMap = 0", false)

