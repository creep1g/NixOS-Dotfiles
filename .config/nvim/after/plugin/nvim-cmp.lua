  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  local servers = { 'pyright', 'clangd', 'lua_ls', 'gopls' }

  for _, lsp in ipairs(servers) do
	  require('lspconfig')[lsp].setup {
		capabilities = capabilities
	  }
  end

  require('lspconfig')['gopls'].setup{
  	cmd={'gopls'},
	filetypes={'go', 'gomod'},
	}
  
 require('lspconfig')['eslint'].setup{
	cmd = { "vscode-eslint-language-server", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue", "svelte", "astro" },
-- 	handlers = {
--   ["eslint/confirmESLintExecution"] = <function 1>,
--   ["eslint/noLibrary"] = <function 2>,
--   ["eslint/openDoc"] = <function 3>,
--   ["eslint/probeFailed"] = <function 4>
-- }
    settings ={
  codeAction = {
    disableRuleComment = {
      enable = true,
      location = "separateLine"
    },
    showDocumentation = {
      enable = true
    }
  },
  codeActionOnSave = {
    enable = false,
    mode = "all"
  },
  experimental = {
    useFlatConfig = false
  },
  format = true,
  nodePath = "",
  onIgnoredFiles = "off",
  packageManager = "npm",
  problems = {
    shortenToSingleLine = false
  },
  quiet = false,
  rulesCustomizations = {},
  run = "onType",
  useESLintClass = false,
  validate = "on",
  workingDirectory = {
    mode = "location"
  }
},
  	on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
 }
  require('lspconfig')['cssls'].setup{
	  cmd = {"vscode-css-language-server", "--stdio"},
	  filetypes = {"css", "scss", "less"},
	  capabilities = capabilities,
  }

  require('lspconfig')['csharp_ls'].setup{
	  cmd = {"/home/gilli/.dotnet/tools/csharp-ls"},
	  capabilites = capabilites
  }
  require('lspconfig')['omnisharp'].setup{
	    cmd = { "dotnet", "/lib/omnisharp-roslyn/OmniSharp.dll", "--languageserver", "--hostPid", tostring(pid) },

		-- Enables support for reading code style, naming convention and analyzer
		-- settings from .editorconfig.
		enable_editorconfig_support = true,

		-- If true, MSBuild project system will only load projects for files that
		-- were opened in the editor. This setting is useful for big C# codebases
		-- and allows for faster initialization of code navigation features only
		-- for projects that are relevant to code that is being edited. With this
		-- setting enabled OmniSharp may load fewer projects and may thus display
		-- incomplete reference lists for symbols.
		enable_ms_build_load_projects_on_demand = false,

		-- Enables support for roslyn analyzers, code fixes and rulesets.
		enable_roslyn_analyzers = false,

		-- Specifies whether 'using' directives should be grouped and sorted during
		-- document formatting.
		organize_imports_on_format = false,

		-- Enables support for showing unimported types and unimported extension
		-- methods in completion lists. When committed, the appropriate using
		-- directive will be added at the top of the current file. This option can
		-- have a negative impact on initial completion responsiveness,
		-- particularly for the first few completion sessions after opening a
		-- solution.
		enable_import_completion = false,

		-- Specifies whether to include preview versions of the .NET SDK when
		-- determining which version to use for project loading.
		sdk_include_prereleases = true,

		-- Only run analyzers against open files when 'enableRoslynAnalyzers' is
		-- true
		analyze_open_documents_only = false,

		capabilities = capabilities
  }

  vim.g.OmniSharp_server_use_net6 = 1
