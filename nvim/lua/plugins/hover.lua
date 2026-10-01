return {
	"lewis6991/hover.nvim",
	init = function()
		vim.diagnostic.config({
			float = {
				scope = "cursor",
			},
		})
	end,
	opts = {
		providers = {
			{
				module = "hover.providers.lsp",
				priority = 1002,
			},
			"hover.providers.diagnostic",
		},
		preview_opts = {
			border = "single",
		},
		preview_window = false,
		title = true,
		mouse_providers = {
			"hover.providers.lsp",
		},
		mouse_delay = 1000,
	},
}
