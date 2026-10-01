vim.keymap.set("n", "<leader>bm", "<cmd>BufferPick<cr>", { silent = true, desc = "Pick Tab" })
vim.keymap.set("n", "<leader>bd", "<cmd>BufferClose<cr>", { silent = true, desc = "Close Tab" })
vim.keymap.set("n", "<leader>bx", "<cmd>BufferPickDelete<cr>", { silent = true, desc = "Pick Close Tab" })
vim.keymap.set("n", "<leader>br", "<cmd>BufferRestore<cr>", { silent = true, desc = "Restore Tab" })

vim.keymap.set("n", "<leader>bh", "<cmd>BufferPrevious<cr>", { silent = true, desc = "Left Tab" })
vim.keymap.set("n", "<leader>bl", "<cmd>BufferNext<cr>", { silent = true, desc = "Right Tab" })
