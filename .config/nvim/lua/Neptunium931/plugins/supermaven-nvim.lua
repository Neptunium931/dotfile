local OS = vim.loop.os_uname().sysname
if (OS == "OpenBSD") then
   return {}
end
return {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<C-g>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-j>",
      }
    })
  end,
}
