local cmds = {
  {
    name = "C",
    pattern = { "*.c", "*.h" },
    callback = function()
      local bufnr = vim.api.nvim_get_current_buf()
      vim.bo[bufnr].path = vim.o.path .. "include,"
    end,
  },
  {
    name = "Python",
    pattern = { "*.py", "*.pyw" },
    callback = function()
      local bufnr = vim.api.nvim_get_current_buf()
      vim.bo[bufnr].shiftwidth = 4
      vim.bo[bufnr].tabstop = 4
    end,
  },
  {
    name = "Markdown",
    pattern = { "*.md" },
    callback = function()
      local bufnr = vim.api.nvim_get_current_buf()
      local winid = vim.api.nvim_get_current_win()
      vim.bo[bufnr].textwidth = 0
      vim.wo[winid].wrap = false
    end,
  },
  {
    name = "Terminal",
    events = { "TermOpen" },
    callback = function()
      vim.opt_local.spell = false
    end
  },
  {
    name = "Spellcheck",
    events = { "BufReadPost", "BufNewFile" },
    callback = function()
      vim.opt_local.spell = true
      vim.opt_local.spelllang = { "en_us", "pt_br" }
      vim.opt_local.spelloptions = "camel"
      vim.opt_local.spellcapcheck = ""
    end
  },
  {
    name = "Default",
    callback = function()
      local bufnr = vim.api.nvim_get_current_buf()
      vim.bo[bufnr].shiftwidth = 2
      vim.bo[bufnr].tabstop = 2
    end,
  },
}

for _, cmd in ipairs(cmds) do
  vim.api.nvim_create_autocmd(cmd.events or { "BufEnter" }, {
    group = vim.api.nvim_create_augroup(cmd.name, { clear = true }),
    pattern = cmd.pattern or { "*" },
    callback = cmd.callback,
  })
end
