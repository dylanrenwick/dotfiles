local keyset = vim.api.nvim_set_keymap
local silent = { silent = true, noremap = true }
local silent_expr = { silent = true, expr = true, noremap = true }
function _G.coc_check_backspace()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end
function _G.coc_show_docs()
	local cw = vim.fn.expand("<cword>")
	if vim.fn.index({"vim", "help"}, vim.bo.filetype) >= 0 then
		vim.api.nvim_command("h"  .. cw)
	elseif vim.api.nvim_eval("coc#rpc#ready()") then
		vim.fn.CocActionAsync("doHover")
	else
		vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
	end
end

keyset("n", "<Leader>e", ":Neotree toggle<CR>", {})

keyset(
	"i", "<TAB>",
	"coc#pum#visible() ? coc#pum#next(1) : v:lua.coc_check_backspace() ? '<TAB>' : coc#refresh()",
	silent_expr
)
keyset(
	"i", "<S-TAB>",
	"coc#pum#visible() ? coc#pum#prev(1) : '<C-h>'",
	silent_expr
)

keyset(
	"i", "<CR>",
	"coc#pum#visible() ? coc#pum#confirm() : '<C-g>u<CR><C-r>=coc#on_enter()<CR>'",
	silent_expr
)
keyset("i", "<C-space>", "coc#refresh()", silent_expr)

keyset("n", "K", "<CMD> lua _G.coc_show_docs()<CR>", silent)

keyset("n", "<F2>", "<Plug>(coc-rename)", { silent = true })
keyset("n", "<F12>", "<Plug>(coc-definition)", { silent = true })

keyset("n", "<C-p>", ":BufferPick<CR>", silent)
keyset("n", "<C-A-p>", ":BufferPickDelete<CR>", silent)

keyset("n", "<A-c>", ":BufferClose<CR>", silent)
keyset("n", "<A-s-c>", ":BufferRestore<CR>", silent)
keyset("n", "<A-p>", ":BufferPin<CR>", silent)
keyset("n", "<A-n>", ":enew<CR>", silent)
