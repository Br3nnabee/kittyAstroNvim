-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.cmd ":TransparentEnable"

-- Zellij Integration: Hide UI on enter, restore on leave
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    os.execute("zellij action switch-layout plain")
    os.execute("zellij action switch-mode locked")
  end,
})

vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    os.execute("zellij action switch-mode normal")
    os.execute("zellij action switch-layout pills")
  end,
})
