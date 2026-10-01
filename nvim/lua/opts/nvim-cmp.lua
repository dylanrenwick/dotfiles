local cmp = require("cmp")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("easy_dotnet", {
	capabilities = capabilities,
})

vim.lsp.config("mssql_ls", {
	capabilities = capabilities,
})
