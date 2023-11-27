local plugins = {
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, _)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {}
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "codelldb",
        "black",
        "debugpy",
        "mypy",
        "ruff",
        "pyright",
        "beautysh",
        "asm-lsp",
        "asmfmt",
        "latexindent",
        "proselint",
        "rome",
      }
    }
  },
  {
    "moll/vim-bbye",
    -- lazy = false,
    cmd = { "Bdelete", "Bwipeout" },
  },
  {
    "ellisonleao/glow.nvim",
    config = true,
    cmd = "Glow"
  },
  -- {
  --   'edluffy/hologram.nvim',
  --   event = "VeryLazy",
  --   config = function ()
  --     require('hologram').setup{ auto_display = true }
  --   end
  -- },
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    config = function ()
      vim.g.codeium_disable_bindings = 1
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
      vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    end
  },
  {
    "toppair/peek.nvim",
    event = { "BufRead", "BufNewFile" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup({
        auto_load = true,
        close_on_bdelete = true,
        syntax = true,
        theme = 'dark',
        update_on_change = true,
        app = 'firefox',
      })
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
  {
    "lervag/vimtex",
    -- cmd = { "vimtex" },
    config = function ()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_view_general_viewer = "zathura"
      vim.g.vimtex_view_forward_search_on_start = false
      vim.g.vimtex_toc_config = {
          mode = 1,
          fold_enable = 0,
          hide_line_numbers = 1,
          resize = 0,
          refresh_always = 1,
          show_help = 0,
          show_numbers = 1,
          split_pos = 'leftabove',
          split_width = 30,
          tocdeth = 3,
          indent_levels = 1,
          todo_sorted = 1,
      }
    end
  },
  {
    "lervag/vimtex",
    init = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_view_general_viewer = "zathura"
      vim.g.vimtex_view_forward_search_on_start = false
      vim.g.vimtex_toc_config = {
        mode = 1,
        fold_enable = 0,
        hide_line_numbers = 1,
        resize = 0,
        refresh_always = 1,
        show_help = 0,
        show_numbers = 1,
        split_pos = 'leftabove',
        split_width = 30,
        tocdeth = 3,
        indent_levels = 1,
        todo_sorted = 1,
      }
      vim.g.vimtex_compiler_latexmk = {
        options = {
          '-verbose',
          '-file-line-error',
          '-synctex=1',
          '-interaction=nonstopmode',
          '-shell-escape',
        }
      }
      vim.g.vimtex_fold_enabled = 1
      vim.g.vimtex_quickfix_ignore_filters = {
        'Overfull',
        'Underfull',
      }
    end,
    cmd = { "VimtexCompile", "VimtexView", "VimtexClean", "VimtexStop", "VimtexToggle" },
    ft = { "tex" },
    keys = {
      { "<leader>ll", "<cmd>VimtexCompile<cr>", desc = "Compile" },
      { "<leader>lv", "<cmd>VimtexView<cr>", desc = "View" },
    },
    config = function(_, _)
      require("core.utils").load_mappings("vimtex")
    end
  },
}
return plugins
