return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
	},
	init = function() vim.g.barbar_auto_setup = false end,
	opts = {
		animation = false,
	},
}

