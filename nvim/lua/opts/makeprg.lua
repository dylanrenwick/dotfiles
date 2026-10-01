vim.api.nvim_create_autocmd("FileType", {
	pattern = { "rust" },
	callback = function(args)
		local makeprg_by_filetype = {
			rust = "cargo build",
		}

		local filetype = vim.bo[args.buf].filetype
		local makeprg = makeprg_by_filetype[filetype]

		if makeprg then
			vim.bo[args.buf].makeprg = makeprg
		end
	end,
})
