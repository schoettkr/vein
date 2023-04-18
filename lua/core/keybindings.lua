local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function cmd(mode, lhs, cmd_string, opts)
  map(mode, lhs, ("<Cmd>%s<CR>"):format(cmd_string), opts)
end

-- General Keybindings (vanilla vim)
cmd("n", "<leader>Q", "q!")
cmd("n", "<leader>at", "!alacritty &|")
cmd("n", "<leader><tab>", "b#")
cmd("n", "<leader>fs", "up")
cmd("n", "<C-s>", "up")
cmd("n", "<Bslash>", "noh")
cmd("n", "<leader>bd", "bdelete")
cmd("n", "<leader>bD", "bd!")
cmd("n", "<leader>d", "bdelete")
cmd("n", "<leader>D", "bd!")
cmd("n", "<leader>bn", "bnext")
cmd("n", "<leader>bp", "bprevious")
cmd("n", "<leader>ws", "split")
cmd("n", "<leader>wv", "vsplit")
cmd("n", "<leader>wd", "close")
cmd("n", "<leader>wm", "only")
cmd("n", "<leader>qq", "quitall", { desc = "Quit" })
map("n", "<leader>wl", "<C-w>l")
map("n", "<leader>wh", "<C-w>h")
map("n", "<leader>wj", "<C-w>j")
map("n", "<leader>wk", "<C-w>k")
map("n", "<leader>wL", "<C-w>L")
map("n", "<leader>wH", "<C-w>H")
map("n", "<leader>wJ", "<C-w>J")
map("n", "<leader>wK", "<C-w>K")
map("n", "<leader>1", "1<C-w>w")
map("n", "<leader>2", "2<C-w>w")
map("n", "<leader>3", "3<C-w>w")
map("n", "<leader>4", "4<C-w>w")
map("n", "<leader>5", "5<C-w>w")
map("n", "<leader>6", "6<C-w>w")
vim.cmd("vnoremap J :m '>+1<CR>gv=gv")
vim.cmd("vnoremap K :m '<-2<CR>gv=gv")
map("i", "<C-A>", "<Home>")
map("i", "<C-B>", "<Left>")
map("i", "<C-E>", "<End>")
map("i", "<C-F>", "<Right>")
map("i", "<C-Y>", "<Esc>pa")

-- Diagnostics
vim.keymap.set("n", "<leader>ep", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>en", vim.diagnostic.goto_next)
-- End Diagnostics

-- Telescope Keybindings
vim.api.nvim_set_keymap("n", "<space>fp", ":Telescope file_browser<CR>", { noremap = true })
vim.api.nvim_set_keymap(
  "n",
  "<space>ff",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)

function telescope_builtin_mappings()
  local telescope = require("telescope.builtin")
  vim.keymap.set("n", "<leader>pp", telescope.find_files, { desc = "Find project files" })
  vim.keymap.set("n", "<leader>pf", telescope.find_files, { desc = "Find project files" })
  vim.keymap.set("n", "<leader>fr", telescope.oldfiles, { desc = "Find recently opened files" })
  vim.keymap.set("n", "<leader>gb", telescope.git_branches, { desc = "Browse git branches" })
  vim.keymap.set("n", "<leader>p/", telescope.live_grep, { desc = "Search string in project" })
  vim.keymap.set("n", "<leader>pw", telescope.grep_string, { desc = "Search string under cursor" })
  vim.keymap.set("n", "<leader>bb", telescope.buffers, { desc = "Browse buffers" })
  vim.keymap.set("n", "<leader>/", telescope.current_buffer_fuzzy_find, { desc = "Search in current buffer" })
  vim.keymap.set("n", "<leader>'", telescope.resume, { desc = "Resume last picker" })
  vim.keymap.set("n", "<C-c><C-o>", telescope.quickfix, { desc = "Show quickfix list" })
end

-- vim.keymap.set('n', '<C-c> <C-o>', telescope.quickfixhistory, { desc = 'Show quickfix history' })

function telescope_mappings()
  local actions = require("telescope.actions")
  local actions_layout = require("telescope.actions.layout")
  local mappings = {
    i = {
      -- ["<C-j>"] = actions.move_selection_next,
      -- ["<C-k>"] = actions.move_selection_previous,
      -- ["<C-n>"] = actions.cycle_history_next,
      -- ["<C-p>"] = actions.cycle_history_prev,
      ["?"] = actions_layout.toggle_preview,
      ["<C-h>"] = "which_key",
      -- https://github.com/nvim-telescope/telescope.nvim/blob/ccda9f02f3a7e48a4a84fb3c3e853d176af8bdd3/lua/telescope/actions/init.lua#L941
      ["<C-c><C-o>"] = function(prompt_bufnr)
        actions.smart_send_to_qflist(prompt_bufnr)
        actions.open_qflist(prompt_bufnr)
      end,
    },
  }
  return mappings
end

-- End Telescope Keybindings

-- Treesitter Keybindings
function treesitter_textobject_mappings()
  local swap_next, swap_prev = (function()
    local swap_objects = {
      p = "@parameter.inner",
      f = "@function.outer",
      c = "@class.outer",
    }

    local n, p = {}, {}
    for key, obj in pairs(swap_objects) do
      n[string.format("<leader>cx%s", key)] = obj
      p[string.format("<leader>cX%s", key)] = obj
    end

    return n, p
  end)()

  return {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    swap = {
      enable = true,
      swap_next = swap_next,
      swap_previous = swap_prev,
    },
  }
end

function treesitter_incselection_mappings()
  return {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  }
end

-- End Treesitter Keybindings

-- Git Keybdinings
vim.keymap.set("n", "<leader>gs", "<cmd>Neogit<CR>", { desc = "Git status" })
-- End Git Keybdinings

-- Dired Keybindings
vim.keymap.set("n", "<leader>ad", "<cmd>Dired<CR>", { desc = "Dired" })
kmap = vim.api.nvim_buf_set_keymap
opt = { silent = true, noremap = true }
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dired",
  callback = function()
    kmap(0, "n", "q", "<cmd>bdelete<CR>", opt)
    kmap(0, "n", "+", "<Plug>(dired_create)", opt)
  end,
})
-- End Dired Keybindings

-- Start fzf
vim.api.nvim_set_keymap("n", "<leader>pp", "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>pf", "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  "n",
  "<leader>p/",
  "<cmd>lua require('fzf-lua').live_grep()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>pw",
  "<cmd>lua require('fzf-lua').grep_cword()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>pW",
  "<cmd>lua require('fzf-lua').grep_cWORD()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<leader>/", "<cmd>lua require('fzf-lua').blines()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>'", "<cmd>lua require('fzf-lua').resume()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  "n",
  "<leader>lq",
  "<cmd>lua require('fzf-lua').quickfix()<CR>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>fr",
  "<cmd>lua require('fzf-lua').oldfiles()<CR>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>bb",
  "<cmd>lua require('fzf-lua').buffers()<CR>",
  { noremap = true, silent = true }
)

-- End fzf

-- Hop
vim.api.nvim_set_keymap('n', '<leader><leader>', ":HopChar1<cr>", {})
-- End Hop

return {
  telescope_mappings = telescope_mappings,
  telescope_builtin_mappings = telescope_builtin_mappings,
  treesitter_textobject_mappings = treesitter_textobject_mappings,
  treesitter_incselection_mappings = treesitter_incselection_mappings,
}
