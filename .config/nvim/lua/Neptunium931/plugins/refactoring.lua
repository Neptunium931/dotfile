return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "lewis6991/async.nvim",
  },
  config = function()
    require("refactoring").setup({
      prompt_func_return_type = {
        cpp = true,
        c = true,
      },
    })
  end,
}
