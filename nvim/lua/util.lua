local M = {}

M.set_theme = function()
  vim.ui.select(vim.g.themes, { prompt = "Select theme to set" }, function(choice)
    if choice ~= nil then
      vim.cmd([[colorscheme ]] .. choice)
    end
  end)
end

return M
