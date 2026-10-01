return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event= "VeryLazy",
	priority = 1000,
	opts = {
		multilines = {
			enabled = true,
			always_show = true,
			severity = { vim.diagnostic.severity.ERROR },
		}
	}
}
