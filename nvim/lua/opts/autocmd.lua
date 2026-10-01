local no_highlight_after_sub = vim.api.nvim_create_augroup("NoHighlightAfterSub", { clear = true })

vim.api.nvim_create_autocmd("CmdlineLeave", {
	group = no_highlight_after_sub,
	callback = function()
		if vim.fn.getcmdtype() == ":" and vim.fn.getcmdline():match("^s") then
			vim.cmd("nohlsearch")
		end
	end,
})
