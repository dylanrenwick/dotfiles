require('lazy').setup({
	{ "NTBBloodbath/doom-one.nvim" },
	{
		"romgrk/barbar.nvim",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" }
		}
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" }
		}
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "MunifTanjim/nui.nvim" }
		}
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{ "mfussenegger/nvim-treehopper" },
			{ "mizlan/iswap.nvim" },
			{ "romgrk/nvim-treesitter-context" },
			{ "cshuaimin/ssr.nvim" },
		}
	},
	{
		"neoclide/coc.nvim",
		branch = "release"
	},
}, {})
