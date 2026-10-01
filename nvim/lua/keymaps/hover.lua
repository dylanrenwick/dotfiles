local hover = require("hover")

vim.keymap.set("n", "K", hover.open, { desc = "Hover (open)" })
vim.keymap.set("n", "<MouseMove>", hover.mouse, { desc = "Hover (mouse)" })
