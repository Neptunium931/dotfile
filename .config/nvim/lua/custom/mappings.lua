local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
  }
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    }
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
    }
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

M.refactor = {
  plugin = true,
  n = {
    ["<leader>ri"] = {
      ":Refactor inline_var",
      "refactor  inline_var",
    },
    ["<leader>rI"] = {
      ":Refactor inline_func",
      "refactor inline_func",
    },
    ["<leader>rb"] = {
      ":Refactor extract_block",
      "refactor extract_block",
    },
    ["<leader>rbf"] = {
      ":Refactor extract_block_to_file",
      "refactor extract_block_to_file",
    },
  },
  x = {
    ["<leader>re"] = {
      ":Refactor extract",
      "refactor extract",
    },
    ["<leader>rf"] = {
      ":Refactor extract_to_file",
      "refactor extract_to_file",
    },
    ["<leader>rv"] = {
      ":Refactor extract_var",
      "refactor extract_var",
    },
    ["<leader>ri"] = {
      ":Refactor inline_var",
      "refactor inline_var",
    },
  }
}
return M
