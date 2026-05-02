local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('nvim-lua/plenary.nvim')

-- Telescope
Plug('nvim-telescope/telescope.nvim', { ['tag'] = 'v0.1.9' })
Plug('nvim-telescope/telescope-file-browser.nvim')

-- DiffView
Plug('sindrets/diffview.nvim')

-- Conform
Plug('stevearc/conform.nvim')

-- Completion
Plug('hrsh7th/nvim-cmp')

-- LuaLine
Plug('nvim-lualine/lualine.nvim')

-- Files icons
Plug('nvim-tree/nvim-web-devicons')

-- LSP
Plug('neovim/nvim-lspconfig')

-- Colorscheme
Plug('catppuccin/nvim', { ['as'] = 'catppuccin' })

vim.call('plug#end')
