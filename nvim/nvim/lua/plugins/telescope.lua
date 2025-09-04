require('telescope').setup{
    extensions = {
        file_browser = {
            hijack_netrw = true,
        },
    },
}

require("telescope").load_extension "file_browser"

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set("n", "<leader>fb", function()
	require("telescope").extensions.file_browser.file_browser()
end)
