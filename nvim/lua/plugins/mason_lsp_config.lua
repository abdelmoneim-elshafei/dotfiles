local opts = {
	ensure_installed = {
		"efm",
		"bashls",
		"tsserver",
		"tailwindcss",
		"pyright",
		"lua_ls",
		"emmet_ls",
		"jsonls",
		"clangd",
        "cssls",
        "dockerls",
        "docker_compose_language_service",
        "html",
        "jdtls",
        "rust_analyzer",
        "sqlls",
        "taplo",
        "lemminx",
        "yamlls",
	},

	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}
