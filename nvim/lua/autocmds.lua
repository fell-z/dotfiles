local langs = {
  python = {
    group = vim.api.nvim_create_augroup("Python", { clear = true }),
    pattern = { "*.py", "*.pyw" },
    callback = function()
      local bufnr = vim.api.nvim_get_current_buf()
      vim.bo[bufnr].shiftwidth = 4
      vim.bo[bufnr].tabstop = 4
    end,
  },
  default = {
    group = vim.api.nvim_create_augroup("Default", { clear = true }),
    pattern = { "*" },
    callback = function()
      local bufnr = vim.api.nvim_get_current_buf()
      vim.bo[bufnr].shiftwidth = 2
      vim.bo[bufnr].tabstop = 2
    end
  }
}

for _lang, settings in pairs(langs) do
  vim.api.nvim_create_autocmd({ "BufEnter" }, {
    group = settings.group,
    pattern = settings.pattern,
    callback = settings.callback,
  })
end
