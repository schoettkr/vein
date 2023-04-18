return {
  {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { "j-hui/fidget.nvim", opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      { "folke/neodev.nvim" },
    },
    config = function()
      -- Switch for controlling whether you want autoformatting.
      --  Use :VeinToggleAutoFormat to toggle autoformatting on or off
      local format_is_enabled = true
      vim.api.nvim_create_user_command("VeinToggleAutoFormat", function()
        format_is_enabled = not format_is_enabled
        print("Setting autoformatting to: " .. tostring(format_is_enabled))
      end, {})

      -- Create an augroup that is used for managing our formatting autocmds.
      --      We need one augroup per client to make sure that multiple clients
      --      can attach to the same buffer without interfering with each other.
      local _augroups = {}
      local get_augroup = function(client)
        if not _augroups[client.id] then
          local group_name = "vein-lsp-format-" .. client.name
          local id = vim.api.nvim_create_augroup(group_name, { clear = true })
          _augroups[client.id] = id
        end

        return _augroups[client.id]
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("vein-lsp-attach-format", { clear = true }),
        -- This is where we attach the autoformatting for reasonable clients
        callback = function(args)
          local client_id = args.data.client_id
          local client = vim.lsp.get_client_by_id(client_id)
          local bufnr = args.buf

          -- Only attach to clients that support document formatting
          if not client.server_capabilities.documentFormattingProvider then
            return
          end

          -- Tsserver usually works poorly. Sorry you work with bad languages
          -- You can remove this line if you know what you're doing :)
          if client.name == "tsserver" then
            return
          end

          if client.name == "jdtls" then -- no autoformat with lsp language server (ldts) but with null-ls google formatter
            return
          end

          -- Create an autocmd that will run *before* we save the buffer.
          --  Run the formatting command for the LSP that has just attached.
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = get_augroup(client),
            buffer = bufnr,
            callback = function()
              if not format_is_enabled then
                return
              end

              vim.lsp.buf.format({
                async = false,
                filter = function(c)
                  return c.id == client.id
                end,
              })
            end,
          })
        end,
      })

      local on_attach = function(_, bufnr)
        -- NOTE: Remember that lua is a real programming language, and as such it is possible
        -- to define small helper and utility functions so you don't have to repeat yourself
        -- many times.
        --
        -- In this case, we create a function that lets us more easily define mappings specific
        -- for LSP related items. It sets the mode, buffer and description for us each time.
        local nmap = function(keys, func, desc)
          if desc then
            desc = "LSP: " .. desc
          end

          vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end

        -- nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

        nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
        nmap("gr", require("fzf-lua").lsp_references, "[G]oto [R]eferences")
        nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
        nmap("mr", vim.lsp.buf.rename, "Change/rename")
        -- nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
        -- nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        -- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        -- See `:help K` for why this keymap
        nmap("gh", vim.lsp.buf.hover, "Hover Documentation")
        -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

        -- Lesser used LSP functionality
        nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        -- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
        -- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
        -- nmap('<leader>wl', function()
        --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, '[W]orkspace [L]ist Folders')

        -- Create a command `:Format` local to the LSP buffer
        vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
          vim.lsp.buf.format()
        end, { desc = "Format current buffer with LSP" })
      end

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. They will be passed to
      --  the `settings` field of the server config. You must look up that documentation yourself.
      local servers = {
        -- clangd = {},
        -- gopls = {},
        -- pyright = {},
        -- rust_analyzer = {},
        tsserver = {}, -- make sure to not be on spotify or some other custom npm registry
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
        jdtls = {}
      }

      -- Setup neovim lua configuration
      require("neodev").setup()

      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      -- Setup mason so it can manage external tooling
      require("mason").setup()

      -- Ensure the servers above are installed
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers),
      })

      mason_lspconfig.setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
          })
        end,
      })
    end,
  },
  -- {
  --   "jay-babu/mason-null-ls.nvim",
  --   -- event = { "BufReadPre", "BufNewFile" },
  --   dependencies = {
  --     "williamboman/mason.nvim",
  --     "jose-elias-alvarez/null-ls.nvim",
  --   },
  --   config = function()
  --     local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
  --     require("mason-null-ls").setup({
  --       ensure_installed = { "stylua", "jq", "prettier" },
  --       sources = require("null-ls").builtins.formatting.prettier.with({
  --         extra_filetypes = { "typescriptreact", "typescript", "javascript" } }),
  --       on_attach = function(client, bufnr)
  --         if client.supports_method("textDocument/formatting") then
  --           vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  --           vim.api.nvim_create_autocmd("BufWritePre", {
  --             group = augroup,
  --             buffer = bufnr,
  --             callback = function()
  --               vim.lsp.buf.format({
  --                 bufnr = bufnr,
  --                 filter = function(lclient)
  --                   return lclient.name == "null-ls"
  --                 end,
  --               })
  --             end,
  --           })
  --         end
  --       end,
  --     })
  --   end,
  -- }
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      -- Here is the formatting config
      local null_ls = require("null-ls")
      local lSsources = {
        null_ls.builtins.formatting.prettier.with({
          filetypes = {
            "javascript",
            "typescript",
            "typescriptreact",
            "css",
            "scss",
            "html",
            "json",
            "yaml",
            "markdown",
            "graphql",
            "md",
            "txt",
          },
          only_local = "node_modules/.bin",
        }),
        null_ls.builtins.formatting.stylua.with({
          filetypes = {
            "lua",
          },
          args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
        }),
        -- brew install google-java-format
        null_ls.builtins.formatting.google_java_format.with({ filetypes = { 'java' } }), -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#google_java_format
        null_ls.builtins.diagnostics.stylelint.with({
          filetypes = {
            "css",
            "scss",
          },
        })
      }

      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      require("null-ls").setup({
        sources = lSsources,
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({
                  bufnr = bufnr,
                  filter = function(client)
                    return client.name == "null-ls"
                  end,
                })
              end,
            })
          end
        end,
      })
    end,
  },
}
