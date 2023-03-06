local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function cmd(mode, lhs, cmd_string, opts)
  map(mode, lhs, ("<Cmd>%s<CR>"):format(cmd_string), opts)
end

-- General Keybindings (vanilla vim)
cmd("n", "<leader>Q",  "q!")
cmd("n", "<leader>at",  "!alacritty &|")
cmd("n", "<leader><tab>",  "b#")
cmd("n", "<leader>fs", "up")
cmd("n", "<C-s>", "up")
cmd("n", "<Bslash>", "noh")
cmd("n", "<leader>bd", "bdelete")
cmd("n", "<leader>bD", "bd!")
cmd("n", "<leader>d",  "bdelete")
cmd("n", "<leader>D",   "bd!")
cmd("n", "<leader>bn",   "bnext")
cmd("n", "<leader>bp",   "bprevious")
cmd("n", "<leader>ws", "split")
cmd("n", "<leader>wv", "vsplit")
cmd("n", "<leader>wd", "close")
cmd("n", "<leader>wm", "only")
cmd("n", "<leader>qq", "quitall", {desc = "Quit"})
map("n", "<leader>wl", "<C-w>l")
map("n", "<leader>wh", "<C-w>h")
map("n", "<leader>wj", "<C-w>j")
map("n", "<leader>wk", "<C-w>k")
map("n", "<leader>wL", "<C-w>L")
map("n", "<leader>wH", "<C-w>H")
map("n", "<leader>wJ", "<C-w>J")
map("n", "<leader>wK", "<C-w>K")
map("n", "<leader>1",  "1<C-w>w")
map("n", "<leader>2",  "2<C-w>w")
map("n", "<leader>3",  "3<C-w>w")
map("n", "<leader>4",  "4<C-w>w")
map("n", "<leader>5",  "5<C-w>w")
map("n", "<leader>6",  "6<C-w>w")
vim.cmd("vnoremap J :m '>+1<CR>gv=gv")
vim.cmd("vnoremap K :m '<-2<CR>gv=gv")
map("i", "<C-A>",  "<Home>")
map("i", "<C-B>",  "<Left>")
map("i", "<C-E>",  "<End>")
map("i", "<C-F>",  "<Right>")
map("i", "<C-Y>",  "<Esc>pa")


-- Diagnostics
vim.keymap.set('n', '<leader>ep', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>en', vim.diagnostic.goto_next)
-- End Diagnostics

-- Telescope Keybindings
-- See `:help telescope.builtin`
-- vim.keymap.set('n', '<leader>fr', require('telescope.builtin').oldfiles, { desc = 'Find recently opened files' })
-- vim.keymap.set('n', '<leader>bb', require('telescope.builtin').buffers, { desc = 'Browse buffers' })
-- vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
--   require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--     winblend = 10,
--     previewer = false,
--   })
-- end, { desc = '[/] Fuzzily search in current buffer' })
-- vim.keymap.set('n', '<leader>pf', require('telescope.builtin').find_files, { desc = 'Find file' })
-- vim.keymap.set('n', '<leader>pp', require('telescope.builtin').find_files, { desc = 'Find file' })
-- vim.keymap.set('n', '<leader>hh', require('telescope.builtin').help_tags, { desc = 'Search help' })
-- vim.keymap.set('n', '<leader>pw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
-- vim.keymap.set('n', '<leader>p/', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
-- vim.keymap.set('n', '<leader>hd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- End Telescope Keybindings


