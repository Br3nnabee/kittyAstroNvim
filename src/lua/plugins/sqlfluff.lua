---@type LazySpec
return {
  { import = "astrocommunity.pack.sql" },

  -- conform.nvim – formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sql = { "sqlfluff" },
      },
      formatters = {
        sqlfluff = {
          args = { "format", "--dialect=postgres", "-" },
          require_cwd = false,
        },
      },
    },
  },

   -- nvim-lint – diagnostics / linting
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.sql = { "sqlfluff" }

      opts.linters = opts.linters or {}
      opts.linters.sqlfluff = {
        args = { "lint", "--dialect=postgres", "--format=json", "-" },
      }
    end,
    -- Add this config function to override lazy's default setup attempt
    config = function(_, opts)
      local lint = require("lint")
      lint.linters_by_ft = opts.linters_by_ft
      
      for name, linter in pairs(opts.linters or {}) do
        lint.linters[name] = vim.tbl_deep_extend("force", lint.linters[name] or {}, linter)
      end
    end,
  },
}
