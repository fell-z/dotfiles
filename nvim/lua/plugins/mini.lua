return {
  {
    "echasnovski/mini.files",
    version = false,
    opts = {},
    keys = {
      {
        "<leader>eft",
        function ()
          require("mini.files").open(vim.uv.cwd(), true)
        end,
        desc = "Open mini.files",
      }
    }
  },

  {
    "echasnovski/mini.ai",
    version = false,
    event = "VeryLazy",
    opts = function ()
      local ai = require("mini.ai")
      return {
        n_lines = 500,
        custom_textobjects = {
          o = ai.gen_spec.treesitter({ -- code block
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }),
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
          c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
          t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
        }
      }
    end
  }
}
