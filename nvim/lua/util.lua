local M = {}

M.set_theme = function()
  vim.ui.select(vim.g.themes, { prompt = "Select theme to set" }, function(choice)
    if choice ~= nil then
      vim.cmd([[colorscheme ]] .. choice)
    end
  end)
end

M.wsl_running = function()
	local wslinfo_path = vim.fn.exepath("wslinfo")

	if wslinfo_path == "" then
		return false
	end

	if vim.fn.getftype(wslinfo_path) == "link" then
		local exec = require("lazy.manage.process").exec

		local _, code = exec("wslinfo", { args = { "--version" } })

		return code == 0
	end
end

return M
