---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- Tell treesitter to use the executable provided by Nix
    opts.prefer_git = true
    
    opts.highlight = opts.highlight or {}
    opts.highlight.additional_vim_regex_highlighting =
      require("astrocore").list_insert_unique(opts.highlight.additional_vim_regex_highlighting or {}, { "sql" })
      
    -- Explicitly ensure Godot parsers are installed to prevent the quickgd crash
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed or {}, { 
      "gdscript", 
      "godot_resource", 
      "gdshader",
      "markdown",
      "markdown_inline"
    })
  end,
}
