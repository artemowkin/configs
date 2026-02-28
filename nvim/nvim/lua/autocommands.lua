local TrimWhiteSpaceGrp = vim.api.nvim_create_augroup("TrimWhitespaceGroup", {
    clear = false
})

vim.api.nvim_create_autocmd('BufWritePre', {
	group = TrimWhiteSpaceGrp,

    pattern = '*',
    command = '%s/\\s\\+$//e',
})

vim.api.nvim_create_autocmd({'BufWritePre'}, {
    pattern = '*.py',
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end
})

vim.api.nvim_create_autocmd({'BufWritePre'}, {
    pattern = '*.go',
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end
})
