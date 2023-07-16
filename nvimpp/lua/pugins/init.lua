local default_plugins = {
  {
    "nvim-tree/nvim-web-devicons",
    opts = function()
      return { override = require("plugins.configs.devicons") }
    end,
    config = function (_, opts)
      require("nvim-web-devicons").setup(opts)
    end
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    init = function ()
      require("core.utils").load_mappings "nvimtree"
    end,
    opts = function ()
      return require("plugins.configs.nvimtree")
    end,
    config = function (_, opts)
      require("nvim-tree").setup(opts)
      vim.g.nvimtree_side = opts.view.side
    end,
  },

}

local config = require("core.default_config")

if #config.plugins > 0 then
  table.insert(default_plugins, { import = config.plugins })
end

require("lazy").setup(default_plugins, config.lazy_nvim)
