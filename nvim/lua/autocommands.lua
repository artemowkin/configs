vim.api.nvim_create_autocmd({'BufWritePre'}, {
  pattern = '*.go',
  callback = function()
    local params = vim.lsp.util.make_range_params(nil, vim.lsp.util._get_offset_encoding())
    params.context = { only = {'source.organizeImports'} }
    local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params, 3000)
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit, vim.lsp.util._get_offset_encoding())
        else
          vim.lsp.buf.execute_command(r.command)
        end
      end
    end
  end,
})

vim.api.nvim_create_autocmd({'BufWritePre'}, {
  pattern = '*.go',
  callback = function()
    vim.lsp.buf.format(nil, 3000)
  end
})


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

