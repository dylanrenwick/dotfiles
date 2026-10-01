return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		animation = false,
		seperator_at_end = false,
		sidebar_filetypes = {
			["neo-tree"] = { event = "BufWipeout" },
		},
	},
}
