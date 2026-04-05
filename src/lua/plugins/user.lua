---@type LazySpec
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup { flavour = "mocha" }
    end,
  },
  -- AstroNvim v6 uses snacks.nvim for the dashboard and notifications
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
   ▄█   ▄█▄  ▄█      ███         ███     ▄██   ▄   
  ███ ▄███▀ ███  ▀█████████▄ ▀█████████▄ ███   ██▄ 
  ███▐██▀   ███▌    ▀███▀▀██    ▀███▀▀██ ███▄▄▄███ 
 ▄█████▀    ███▌     ███   ▀     ███   ▀ ▀▀▀▀▀▀███ 
▀▀█████▄    ███▌     ███         ███     ▄██   ███ 
  ███▐██▄   ███      ███         ███     ███   ███ 
  ███ ▀███▄ ███      ███         ███     ███   ███ 
  ██    ▀█▀ █▀      ▄████▀      ▄████▀    ▀█████▀  

 ███▄▄▄▄    ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄         ████████▄  
 ███▀▀▀██▄ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄       ███    ███ 
 ███   ███ ███    ███ ███▌ ███   ███   ███    ██  ▀█    ███ 
 ███   ███ ███    ███ ███▌ ███   ███   ███           ▄▄▄███ 
 ███   ███ ███    ███ ███▌ ███   ███   ███            ▀▀▀██ 
 ███   ███ ███    ███ ███  ███   ███   ███    ██  ▄█    ███ 
 ███   ███ ███    ███ ███  ███   ███   ███       ███    ███ 
  ▀█   █▀   ▀██████▀  █▀    ▀█   ███   █▀         ███████▀  
          ]],
        },
      },
      notifier = { enabled = true },
    },
  },
  -- NixOS Fix: Build blink.cmp from source using your local Rust tools
  {
    "saghen/blink.cmp",
    build = "cargo build --release",
  },
}