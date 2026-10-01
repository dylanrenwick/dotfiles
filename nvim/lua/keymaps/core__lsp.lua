local dap = require("dap")
local dotnet = require("easy-dotnet")

local function is_dotnet_workspace()
	local dotnet_filetypes = {
		"cs", "csproj", "sln", "slnx",
	}

	local root = vim.fs.root(0, {
		"*.sln",
		"*.slnx",
		"*.csproj",
	})
	local filetype = vim.bo.filetype

	return root ~= nil and vim.tbl_contains(dotnet_filetypes, filetype)
end

local function build()
	if is_dotnet_workspace() then
		dotnet.build()
	else
		vim.cmd.make()
	end
end

-- Start debug
vim.keymap.set("n", "<f5>", function()
	-- If currently debugging
	if dap.session() then
		dap.continue()
	-- If in dotnet workspace
	elseif is_dotnet_workspace() then
		dotnet.debug()
	-- Fallback
	else
		dap.continue()
	end
end, { desc = "Debug" })
-- Refresh diagnostics
vim.keymap.set("n", "<F3>", function()
	vim.cmd.wall()

	for _, client in ipairs(vim.lsp.get_clients({ name = "easy_dotnet" })) do
		-- Workspace diagnostics are stored in Roslyn's push namespace, while
		-- normal Roslyn diagnostics are pulled into separate namespaces. Clear
		-- any old workspace snapshot so it cannot outlive the pull diagnostics.
		local push_namespace = vim.lsp.diagnostic.get_namespace(client.id)
		vim.diagnostic.reset(vim.lsp.diagnostic.get_namespace(client.id))

		for bufnr in pairs(client.attached_buffers) do
			if vim.api.nvim_buf_is_loaded(bufnr) then
				vim.lsp.diagnostic._refresh(bufnr, client.id)
			end
		end
	end
end, { desc = "Refresh diagnostics" })
-- Build
vim.keymap.set("n", "<F6>", function()
	if is_dotnet_workspace() then
		dotnet.build()
	else
		vim.cmd.make()
	end
end, { desc = "Build" })

vim.keymap.set("n", "<esc>", function()
	if dap.session() then
		dap.terminate()
		return ""
	else
		return "<esc>"
	end
end, { expr = true })

vim.keymap.set("n", "<f11>", dap.step_into, { desc = "DBG Step Into" })
vim.keymap.set("n", "<f10>", dap.step_over, { desc = "DBG Step Over" })
vim.keymap.set("n", "<s-f11>", dap.step_out, { desc = "DBG Step Out" })

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })

vim.keymap.set("n", "<leader>,", vim.lsp.buf.code_action, { desc = "Code Actions" })
vim.keymap.set("n", "<F12>", vim.lsp.buf.definition, { desc = "Go to Definition" })

