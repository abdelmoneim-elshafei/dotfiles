----------------local on_attach = require("util.lsp").on_attach

return {
    "mfussenegger/nvim-jdtls",
    --config = function()
    --     local config = {
    --         cmd = {vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls")},
    --         root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    --         on_attach = on_attach,
    --     }
    --     require('jdtls').start_or_attach(config)
    -- end
}
