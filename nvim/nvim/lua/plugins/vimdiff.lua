local actions = require("diffview.actions")

require("diffview").setup({
    view = {
        merge_tool = {
            layout = "diff3_mixed",
            disable_diagnostics = true,
            winbar_info = true,
        },
    }
})
