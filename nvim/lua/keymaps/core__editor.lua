for _, mode in ipairs({ "n", "v", "i" }) do
	vim.keymap.set(mode, "<LeftMouse>", "<Nop>")
	vim.keymap.set(mode, "<2-LeftMouse>", "<Nop>")
	vim.keymap.set(mode, "<3-LeftMouse>", "<Nop>")
end
