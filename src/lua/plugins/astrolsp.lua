-- Configuration documentation can be found with `:h astrolsp`

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      autoformat = true,
      codelens = false, -- Disabled per AstroNvim v6.0.2 defaults due to Neovim 0.11 bug
      inlay_hints = false,
      semantic_tokens = true,
    },
    formatting = {
      format_on_save = {
        enabled = true,
      },
      timeout_ms = 90000,
    },
    config = {
      pyright = {
        -- "pyproject" because monorepos are common and poetry is universal for me
        root_dir = require("lspconfig/util").root_pattern "pyproject.toml",
      },
    },
    -- Autocmds for document highlighting removed! 
    -- AstroNvim v6 now natively handles this via snacks.words, and custom autocmds here will cause flickering/conflicts.
    mappings = {
      n = {
        gl = { function() vim.diagnostic.open_float() end, desc = "Hover diagnostics" },
      },
    },
  },
}