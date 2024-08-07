local langs = {
  c = {
    augroup = vim.api.nvim_create_augroup("C", { clear = true }),
    pattern = { "*.c", "*.h" },
    config = function()
      local bufnr = vim.api.nvim_get_current_buf()
      vim.bo[bufnr].shiftwidth = 4
    end,
  },
  cpp = {
    augroup = vim.api.nvim_create_augroup("Cpp", { clear = true }),
    pattern = { "*.cpp", "*.hpp" },
    config = function()
      local bufnr = vim.api.nvim_get_current_buf()
      vim.bo[bufnr].shiftwidth = 4
    end,
  },
  python = {
    augroup = vim.api.nvim_create_augroup("Python", { clear = true }),
    pattern = { "*.py", "*.pyw" },
    config = function()
      local bufnr = vim.api.nvim_get_current_buf()
      vim.bo[bufnr].shiftwidth = 4
    end,
  },
  ruby = {
    augroup = vim.api.nvim_create_augroup("Ruby", { clear = true }),
    pattern = { "*.rb" },
    config = function()
      require("nvim-highlight-colors").turnOff()
    end,
  },
}

for _lang, settings in pairs(langs) do
  vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = settings.pattern,
    group = settings.augroup,
    callback = settings.config,
  })
end
