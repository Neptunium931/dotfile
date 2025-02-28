local M = {}

M.n = {
  ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
  ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
  ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
  ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
  -- close buffer
  ["<S-q>"] = { "<cmd>Bdelete<CR>", "close buffer"},
  ["<leader>lv"] = {
    function()
      vim.cmd("VimtexView")
    end
  },
  ["<leader>ll"] = {
    function()
      vim.cmd("VimtexCompile")
    end
  }
}
return M
