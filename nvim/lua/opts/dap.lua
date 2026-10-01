local dap = require("dap")
dap.listeners.after.event_stopped["center-after-step"] = function()
	vim.schedule(function()
		vim.cmd.normal({ args = { "zz" }, bang = true })
	end)
end
