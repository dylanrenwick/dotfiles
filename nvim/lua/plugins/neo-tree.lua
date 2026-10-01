local startup_buffer = vim.api.nvim_get_current_buf()

local function close_empty_startup_buffer()
	local bufnr = startup_buffer
	startup_buffer = nil

	if not bufnr or not vim.api.nvim_buf_is_valid(bufnr) or bufnr == vim.api.nvim_get_current_buf() then
		return
	end

	local is_empty = vim.api.nvim_buf_get_name(bufnr) == ""
		and vim.bo[bufnr].buftype == ""
		and not vim.bo[bufnr].modified
		and vim.api.nvim_buf_line_count(bufnr) == 1
		and vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] == ""

	if is_empty then
		vim.api.nvim_buf_delete(bufnr, {})
	end
end

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	opts = {
		close_if_last_window = true,
		event_handlers = {
			{
				event = "file_opened",
				handler = close_empty_startup_buffer,
			},
		},
		window = {
			width = 35,
		},
	},
}
