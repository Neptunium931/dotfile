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
return M
