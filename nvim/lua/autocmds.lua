local langs = {
  c = {
    group = vim.api.nvim_create_augroup("C", { clear = true }),
    pattern = { "*.c", "*.h" },
    callback = function()
      local bufnr = vim.api.nvim_get_current_buf()
      vim.bo[bufnr].path = vim.o.path .. "include,"
    end,
  },
  python = {
    group = vim.api.nvim_create_augroup("Python", { clear = true }),
    pattern = { "*.py", "*.pyw" },
    callback = function()
      local bufnr = vim.api.nvim_get_current_buf()
      vim.bo[bufnr].shiftwidth = 4
      vim.bo[bufnr].tabstop = 4
    end,
  },
  markdown = {
    group = vim.api.nvim_create_augroup("Markdown", { clear = true }),
    pattern = { "*.md" },
    callback = function()
      local bufnr = vim.api.nvim_get_current_buf()
      local winid = vim.api.nvim_get_current_win()
      vim.bo[bufnr].textwidth = 0
      vim.wo[winid].wrap = false
    end
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
