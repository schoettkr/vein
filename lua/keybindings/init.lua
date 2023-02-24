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

-- Esearch
vim.api.nvim_exec("nmap <leader>P/ <plug>(esearch)", false)

-- LSP
cmd("", "gd", "lua vim.lsp.buf.definition()")
cmd("", "gD", "lua vim.lsp.buf.declaration()")
cmd("", "gr", "lua vim.lsp.buf.references()")
cmd("", "gh", "lua vim.lsp.buf.hover()")
cmd("", "gi", "lua vim.lsp.buf.implementation()")
cmd("", "<leader>gp", "lua vim.lsp.diagnostic.goto_prev()")
cmd("", "<leader>gn", "lua vim.lsp.diagnostic.goto_next()")
cmd("", "<leader>ep", "lua vim.lsp.diagnostic.goto_prev()")
cmd("", "<leader>en", "lua vim.lsp.diagnostic.goto_next()")
cmd("", "<leader>ca", "lua vim.lsp.buf.code_action()")

-- Compe
vim.cmd("inoremap <silent><expr> <CR> compe#confirm('<CR>')")

-- Findr
cmd("", "<leader>ff", "Telescope file_browser")

-- FZF
cmd("", "<leader>bb", "FzfBuffers")
cmd("", "<leader>fr", "FzfHistory")
cmd("", "<leader>mm", "FzfMarks")
cmd("", "<leader>pp", "FzfFiles")
cmd("", "<leader>p/", "FzfRg")
cmd("", "<leader>'",  "FzfHistory:")
cmd("", "<leader>/",  "FzfBLines")

-- Hop
vim.api.nvim_set_keymap('n', '<leader><leader>', ":HopChar1<cr>", {})

-- Neogit
cmd("n", "<leader>gs", "Neogit")

-- Nvim Tree
cmd("", "<leader>ft" , "NvimTreeFindFile")
cmd("", "<leader>ad" , "NvimTreeFindFile")

-- Win Layout
vim.api.nvim_exec('nmap <leader>wu <Plug>(WinlayoutBackward)', false)
vim.api.nvim_exec('nmap <leader>wr <Plug>(WinlayoutForward)', false)

-- Vanilla VIM
cmd("", "<leader>Q",  "q!")
cmd("", "<leader>at",  "!alacritty &|")
cmd("", "<leader><tab>",  "b#")
cmd("", "<leader>fs", "up")
cmd("", "<C-s>", "up")
cmd("", "<Bslash>", "noh")
cmd("", "<leader>bd", "bdelete")
cmd("", "<leader>bD", "bd!")
cmd("", "<leader>d",  "bdelete")
cmd("", "<leader>D",   "bd!")
cmd("", "<leader>bn",   "bnext")
cmd("", "<leader>bp",   "bprevious")
cmd("", "<leader>ws", "split")
cmd("", "<leader>wv", "vsplit")
cmd("", "<leader>wd", "close")
cmd("", "<leader>wm", "only")
cmd("", "<leader>qq", "quitall")
map("", "<leader>wl", "<C-w>l")
map("", "<leader>wh", "<C-w>h")
map("", "<leader>wj", "<C-w>j")
map("", "<leader>wk", "<C-w>k")
map("", "<leader>wL", "<C-w>L")
map("", "<leader>wH", "<C-w>H")
map("", "<leader>wJ", "<C-w>J")
map("", "<leader>wK", "<C-w>K")
map("", "<leader>1",  "1<C-w>w")
map("", "<leader>2",  "2<C-w>w")
map("", "<leader>3",  "3<C-w>w")
map("", "<leader>4",  "4<C-w>w")
map("", "<leader>5",  "5<C-w>w")
map("", "<leader>6",  "6<C-w>w")
vim.cmd("vnoremap J :m '>+1<CR>gv=gv")
vim.cmd("vnoremap K :m '<-2<CR>gv=gv")
map("i", "<C-A>",  "<Home>")
map("i", "<C-B>",  "<Left>")
map("i", "<C-E>",  "<End>")
map("i", "<C-F>",  "<Right>")
map("i", "<C-Y>",  "<Esc>pa")
