return{
    'nvimdev/lspsaga.nvim',
    lazy = false,
    config = function()
        require('lspsaga').setup({
           move_in_saga = { prev = "<C-k>", next = "<C-j>" },
			finder_action_keys = {
				open = "<CR>",
			},
			definition_action_keys = {
				edit = "<CR>",
			},
           symbol_in_winbar = {
             enable = true,
           },
            ui = {
                code_action = ''
            }
        })
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons'
    }
}

