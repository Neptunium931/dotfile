vim.api.nvim_create_user_command('ColorMyPencils',
function ()
  local hour = tonumber(os.date("%H"))
  local color = "rose-pine-dawn"
  if hour < 19 and hour > 7 then
    color = "rose-pine-dawn"
  else
    color = "rose-pine-moon"
  end
  vim.cmd.colorscheme(color)

  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end , {})

return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require('rose-pine').setup({
      styles = {
        italic = false,
      },
    })

    vim.cmd.ColorMyPencils();
  end
}
