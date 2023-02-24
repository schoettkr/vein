vim.cmd [[packadd nvim-lspconfig]]
vim.cmd [[packadd nvim-compe]]

require("lspkind").init(
    {
        File = " "
    }
)
require "lspconfig".tsserver.setup {}
require "lspconfig".cssls.setup {}
require "lspconfig".html.setup {}
-- require("nvim-lsp-installer").setup {}


-- Should NOT be called when using nvim-jdtls
-- require "lspconfig".jdtls.setup {}

vim.o.completeopt = "menuone,noselect"

require "compe".setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = "disable",
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,
    source = {
        nvim_lsp = true,
        path = true,
        buffer = true,
        calc = true,
        nvim_lua = true,
        spell = true,
        tags = true,
        vsnip = false,
        snippets_nvim = false,
        treesitter = false
    }
}

-- require 'lsp_signature'.on_attach()
