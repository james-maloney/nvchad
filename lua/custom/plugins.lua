local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    init = function()
    end
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
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
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup({
        lsp_codelens = false,
        trouble = true,
      })
      require("core.utils").load_mappings("gopher")
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  {
    "nmac427/guess-indent.nvim",
    lazy = false,
    config = function()
	    require('guess-indent').setup {}
    end,
  },
  {
    'alexghergh/nvim-tmux-navigation',
    lazy = false,
     config = function()
      local nvim_tmux_nav = require('nvim-tmux-navigation')
      nvim_tmux_nav.setup {
        disable_when_zoomed = true -- defaults to false
      }
    end
  },
  {
    "ThePrimeagen/harpoon",
    config = function ()
      local harpoon = require("harpoon")
      harpoon:setup()
    end,
    branch = "harpoon2",
    event = "VeryLazy",
    opts = {},
  },
	{
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup {}
		end
	},
  {
    "tpope/vim-fugitive",
  },
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	},
	{
		"folke/trouble.nvim",
    lazy = false,
		config = function()
			require("trouble").setup {
				icons = true,
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}
}

return plugins
