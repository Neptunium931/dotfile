local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
  }
}

M.general = {
  n = {
    -- close buffer
    ["<S-q>"] = { "<cmd>Bdelete!<CR>", "close buffer"},
  }
}

M.vimtex = {
  plugin = true,
  n = {
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
}
return M
