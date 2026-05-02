local map = vim.keymap.set
local opts = { noremap=true, silent=true }
local cmp = require('cmp')

vim.diagnostic.config({signs=False})

map('n', '<leader>e', vim.diagnostic.open_float, otps)

vim.lsp.enable('pyright')
vim.lsp.enable('ruff')
vim.lsp.enable('gopls')

vim.lsp.config('pyright', {
	filetypes = { 'python' },
	root_markers = {
		'pyrightconfig.json',
		'pyproject.toml',
		'setup.py',
		'setup.cfg',
		'requirements.txt',
		'Pipfile',
		'.git',
	},
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = 'openFilesOnly',
				disableOrganizeImports = true,
			},
		},
	},
	on_attach = function(client, bufnr)
		vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

		local bufopts = { noremap=true, silent=true, buffer=bufnr }

		map('n', 'gD', vim.lsp.buf.declaration, bufopts)
		map('n', 'gd', vim.lsp.buf.definition, bufopts)
		map('n', 'K', vim.lsp.buf.hover, bufopts)

		map('n', 'gi', vim.lsp.buf.implementation, bufopts)
		map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
		map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
		map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
		map('n', '<leader>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, bufopts)
		map('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)

		map('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
		map('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
		map('n', 'gr', vim.lsp.buf.references, bufopts)
		map('n', '<leader>f', vim.lsp.buf.format, bufopts)
	end,
})

vim.lsp.config('ruff', {
	filetypes = { 'python' },
	root_markers = {
		'pyproject.toml',
		'setup.py',
		'setup.cfg',
		'requirements.txt',
		'Pipfile',
		'.git',
	},
    init_options = {
        settings = {
            organizeImports = true,
        },
    },
    on_attach = function(client, bufnr)
        client.server_capabilities.diagnosticProvider = false
        client.server_capabilities.documentFormattingProvider = true
        client.server_capabilities.documentRangeFormattingProvider = true
    end,
})

vim.lsp.config('gopls', {
    cmd = { 'gopls' },
    filetypes={ 'go', 'gomod' },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,   -- warn about unused parameters
                shadow = true,         -- warn about variable shadowing
            },
            staticcheck = true,       -- enable more advanced diagnostics
        },
    },
})

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({
            select = true,
        }),
    }),
    sources = {
        { name = "nvim_lsp" },
    },
})
