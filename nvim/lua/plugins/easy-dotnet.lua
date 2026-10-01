return {
	"GustavEikaas/easy-dotnet.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"mfussenegger/nvim-dap",
	},
	opts = {
		lsp = {
			enabled = true,
			preload_roslyn = true,
			easy_dotnet_analyzer_enabled = true,
			easy_dotnet_extension_enabled = true,
			create_type_from_usage = true,
			auto_refresh_codelens = true,
		},
	},
}
