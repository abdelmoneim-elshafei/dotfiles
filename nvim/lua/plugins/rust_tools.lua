local on_attach = require("util.lsp").on_attach
return{
    'simrat39/rust-tools.nvim',
    config = function ()
    require("rust-tools").setup({
        server = {
            on_attach = on_attach
        },
    })
end
}

-- Hover actions
            -- vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            -- vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })

