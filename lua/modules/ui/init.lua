--vim.api.nvim_exec(
--[[
--if exists('$TMUX')
--" Colors in tmux
--let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"
--let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"
--endif
--]]
--, false)

require('modules.ui.icons')
require('modules.ui.statusline')
require('modules.ui.theme')
