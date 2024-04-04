vim.cmd.colorscheme("doom-one")

vim.g.doom_one_cursor_coloring = false
vim.g.doom_one_terminal_colors = true
vim.g.doom_one_italic_comments = true
vim.g.doom_one_enable_treesitter = true
vim.g.doom_one_plugin_barbar = true

vim.g.airline_theme = "murmur"
vim.g.airline_powerline_fonts = 1

vim.o.encoding = "utf-8"
vim.o.updatetime = 200
vim.o.shiftwidth = 0
vim.o.tabstop = 4
vim.o.wrap = false

vim.wo.signcolumn = "yes"

local treesitter = require("nvim-treesitter.install")
treesitter.prefer_git = false
treesitter.compilers = { "gcc" }

require("barbar").setup({
	animation = false,
	separator_at_end = false,
	minimum_padding = 2,
	maximum_padding = 2,
	no_name_title = '',
	sidebar_filetypes = {
		["neo-tree"] = { event = "BufWipeout" }
	},
})

require("neo-tree").setup({
	close_if_last_window = true,
	window = {
		width = 30
	}
})

require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = "horizon",
    component_separators = { left = "", right = ""},
    section_separators = { left = "", right = ""},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 250,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch", "diff", "diagnostics"},
    lualine_c = {"filename"},
    lualine_x = {"encoding", "fileformat", "filetype"},
    lualine_y = {"progress"},
    lualine_z = {"location"}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {"filename"},
    lualine_x = {"location"},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
