local on_attach = require("util.lsp").on_attach
local diagnostic_signs = require("util.lsp").diagnostic_signs

local config = function()
	require("neoconf").setup({})
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local lspconfig = require("lspconfig")

	for type, icon in pairs(diagnostic_signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	local capabilities = cmp_nvim_lsp.default_capabilities()

    
	-- lua
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = { -- custom settings for lua
			Lua = {
				-- make the language server recognize "vim" global
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- make language server aware of runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})

	-- json
	lspconfig.jsonls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "json", "jsonc" },
	})

	-- python
	lspconfig.pyright.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			pyright = {
				disableOrganizeImports = false,
				analysis = {
					useLibraryCodeForTypes = true,
					autoSearchPaths = true,
					diagnosticMode = "workspace",
					autoImportCompletions = true,
				},
			},
		},
	})

	-- typescript
	lspconfig.tsserver.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"typescript",
            "javascript"
		},
		root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
	})


	-- bash
	lspconfig.bashls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "sh", "aliasrc" },
	})

    lspconfig.eslint.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = {"javascript","typescript","js"},
        bin = 'eslint', -- or `eslint_d`
        code_actions = {
          enable = true,
          apply_on_save = {
            enable = true,
            types = { "directive", "problem", "suggestion", "layout" },
          },
          disable_rule_comment = {
            enable = true,
            location = "separate_line", -- or `same_line`
          },
        },
        diagnostics = {
          enable = true,
          report_unused_disable_directives = false,
          run_on = "type", -- or `save`
        },
    })

	-- typescriptreact, javascriptreact, css, sass, scss, less, svelte, vue
	lspconfig.emmet_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = {
			-- "typescriptreact",
			"javascriptreact",
			-- "javascript",
			"css",
			"sass",
			"scss",
			"less",
			"svelte",
			"vue",
			"html",
		},
	})

	-- docker
	lspconfig.dockerls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	-- C/C++
	lspconfig.clangd.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		cmd = {
			"clangd",
			"--offset-encoding=utf-16",
		},
	})

    lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = { "rust-analyzer"},

        filetyp = {"rust"},

        settings = {
            ['rust_analyzer'] = {

            },
        },

		root_dir = lspconfig.util.root_pattern("Cargo.toml", "Cargo.lock", ".git", "rust-project.json"),
    })

	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")
	local flake8 = require("efmls-configs.linters.flake8")
	local black = require("efmls-configs.formatters.black")
	local eslint_d = require("efmls-configs.linters.eslint_d")
	local prettier_d = require("efmls-configs.formatters.prettier_d")
	local fixjson = require("efmls-configs.formatters.fixjson")
	-- local shellcheck = require("efmls-configs.linters.shellcheck")
	local shfmt = require("efmls-configs.formatters.shfmt")
	local hadolint = require("efmls-configs.linters.hadolint")
	-- local solhint = require("efmls-configs.linters.solhint")
	local cpplint = require("efmls-configs.linters.cpplint")
	local clangformat = require("efmls-configs.formatters.clang_format")
    -- local rust = require("plugins.rust_tools")

	-- configure efm server
	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"python",
			"json",
			"jsonc",
			"sh",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"svelte",
			"vue",
			"markdown",
			"docker",
			"solidity",
			"html",
			"css",
			"c",
			"cpp",
		},

		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
				python = { flake8, black },
				typescript = { eslint_d, prettier_d },
				json = { eslint_d, fixjson },
				jsonc = { eslint_d, fixjson },
				sh = { shfmt },
				javascript = { eslint_d, prettier_d },
				javascriptreact = { eslint_d, prettier_d },
				typescriptreact = { eslint_d, prettier_d },
				svelte = { eslint_d, prettier_d },
				vue = { eslint_d, prettier_d },
				markdown = { prettier_d },
				docker = { hadolint, prettier_d },
				html = { prettier_d },
				css = { prettier_d },
				c = { clangformat, cpplint },
				cpp = { clangformat, cpplint },
			},
		},
	})
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
	},
}






-- local k = vim.keymap
-- local config = function()
--
-- 	local lspconfig = require("lspconfig")
--     local cmp_nvim_lsp = require("cmp_nvim_lsp")
--     local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = "" }
-- 	for type, icon in pairs(signs) do
-- 		local hl = "DiagnosticSign" .. type
-- 		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
-- 	end
--
--     local capabilities = cmp_nvim_lsp.default_capabilities()
--
--     local on_attach = function(clinet,bufnr)
--         local opts = { noremap = true, silent = true, buffer = bufnr  }
--
--         k.set("n", "gf","<cmd>Lspsaga lsp_finder<CR>",opts) -- show definition reference
--         k.set("n", "gD","<cmd>lua vim.lsp.buf.declaration()<CR>",opts) -- go to declaration
--         k.set("n", "gd","<cmd>Lspsaga peek_definition<CR>",opts) -- see definition
--         k.set("n", "gi","<cmd>lua vim.lsp.buf.implementation()<CR>",opts) -- go to implementaion
--         k.set("n", "<leader>ca","<cmd>Lspsaga code_action<CR>",opts) -- see available code action
--         k.set("n", "<leader>rn","<cmd>Lspsaga rename<CR>",opts) -- smart rename
--         k.set("n", "<leader>D","<cmd>Lspsaga show_line_diagnostics<CR>",opts) -- show diagnostics for line
--         k.set("n", "<leader>d","<cmd>Lspsaga show_cursor_diagnostics<CR>",opts) -- show diagnostic for cursor
--         k.set("n", "<leader>pd","<cmd>Lspsaga diagnostic_jump_prev<CR>",opts) --jumb to prev diagnostic
--         k.set("n", "<leader>nd","<cmd>Lspsaga diagnostic_jump_next<CR>",opts) --jumb to next diagnostic
--         k.set("n", "<leader>lo","<cmd>LSoutlineToggle<CR>",opts) --see outline  on right  hand side
--         k.set("n", "K","<cmd>Lspsaga hover_doc<CR>",opts) -- show the documentation for what is under cursor
--
--     end
--
--
--
-- 	-- lua
-- 	lspconfig.lua_ls.setup({
-- 		capabilities = capabilities,
-- 		 on_attach = on_attach,
-- 		 settings = { -- custom settings for lua
-- 			Lua = {
-- 				-- make the language server recognize "vim" global
-- 				diagnostics = {
-- 					globals = { "vim" },
-- 				},
-- 				workspace = {
-- 					-- make language server aware of runtime files
-- 					library = {
-- 						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
-- 						[vim.fn.stdpath("config") .. "/lua"] = true,
-- 					},
-- 				},
-- 			},
-- 		},
-- 	    })
--
--     local jdtls_bin = vim.fn.stdpath("data") .. "/mason/bin/jdtls"
--     -- --java
--     lspconfig.jdtls.setup({
--          capabilities = capabilities,
--          on_attach  = on_attach,
--          cmd = { jdtls_bin },
--          --root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
--     })
--
--
--
--
--     local luacheck = require("efmls-configs.linters.luacheck")
-- 	local stylua = require("efmls-configs.formatters.stylua")
--     local google_java_format = require('efmls-configs.formatters.google_java_format')
-- 	-- configure efm server
--     --
-- 	lspconfig.efm.setup({
-- 		filetypes = {
-- 			"lua",
--             "java",
-- 		},
-- 		init_options = {
-- 			documentFormatting = true,
-- 			documentRangeFormatting = true,
-- 			hover = true,
-- 			documentSymbol = true,
-- 			codeAction = true,
-- 			completion = true,
-- 		},
-- 		settings = {
-- 			languages = {
-- 				lua = { luacheck, stylua },
--                 java = { google_java_format },
-- 			},
-- 		},
-- 	})
-- end
--
-- return {
-- 	"neovim/nvim-lspconfig",
-- 	config = config,
-- 	lazy = false,
-- 	dependencies = {
-- 		"windwp/nvim-autopairs",
-- 		"williamboman/mason.nvim",
-- 		"creativenull/efmls-configs-nvim",
-- 		"hrsh7th/nvim-cmp",
-- 		"hrsh7th/cmp-buffer",
-- 		"hrsh7th/cmp-nvim-lsp",
-- 	},
-- }
