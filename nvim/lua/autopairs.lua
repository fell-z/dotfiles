local npairs_working, npairs = pcall(require, "nvim-autopairs")
if not npairs_working then
  return
end


npairs.setup {
  check_ts = true,
  disable_filetype = { "TelescopePrompt" },
}

local cmp_npairs = require "nvim-autopairs.completion.cmp"
local cmp_working, cmp = pcall(require, "cmp")
if not cmp_working then
  return
end

cmp.event:on(
  "confirm_done",
  cmp_npairs.on_confirm_done()
)

local rule_working, Rule = pcall(require, "nvim-autopairs.rule")
if not rule_working then
  return
end

npairs.add_rules {
  Rule(' ', ' ')
    :with_pair(function (opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end),
  Rule('( ', ' )')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%)') ~= nil
      end)
      :use_key(')'),
  Rule('{ ', ' }')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%}') ~= nil
      end)
      :use_key('}'),
  Rule('[ ', ' ]')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%]') ~= nil
      end)
      :use_key(']')
}
