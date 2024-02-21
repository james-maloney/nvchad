local M = {}

M.general = {
  n = {
    ["<C-h>"] = {
      function ()
        local nvim_tmux_nav = require('nvim-tmux-navigation')
        nvim_tmux_nav.NvimTmuxNavigateLeft()
      end,
      "Window left",
    },
    ["<C-l>"] = {
      function ()
        local nvim_tmux_nav = require('nvim-tmux-navigation')
        nvim_tmux_nav.NvimTmuxNavigateRight()
      end,
      "Window right",
    },
    ["<C-j>"] = {
      function ()
        local nvim_tmux_nav = require('nvim-tmux-navigation')
        nvim_tmux_nav.NvimTmuxNavigateDown()
      end,
      "Window down",
    },
    ["<C-k>"] = {
      function ()
        local nvim_tmux_nav = require('nvim-tmux-navigation')
        nvim_tmux_nav.NvimTmuxNavigateUp()
      end,
      "Window up",
    },
  }
}

M.lspconfig = {
  plugin = true,
  n = {
    ["gv"] = {
      "<cmd> :vsplit | lua vim.lsp.buf.definition() <CR>",
      "LSP definition in split",
    }
  }
}

M.mine = {
  i = {
    ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true }}
  },
  n = {
    ["<leader>zz"] = {
      function ()
        require("zen-mode").toggle({
          window   = {
            backdrop = 1,
            width = .5,
            height = .98,
            options = {
              number = false,
              relativenumber = false,
              signcolumn = "no",
            }
          },
          on_open  = function(_)
             -- os.execute("gohome ex on -n 'Big Guest Room Savanna sunset'")
          end,
          on_close = function()
            -- os.execute("gohome ex on -n 'Big Guest Room Bright'")
          end,
        })
        vim.api.nvim_set_hl(0, "ZenBg", { ctermbg = 0 })
      end,
    },
    ["<leader>tt"] = {
      function ()
        require("base46").toggle_transparency()
      end,
      "Toggle Theme Transparency",
    },
    ["vp"] = {
      "`[v`]",
      "Select pasted text",
    },
  },
}

M.trouble = {
  n = {
    ["<leader>xx"] = {
      "<cmd> TroubleToggle <CR>",
      "Toggle trouble window",
      silent = true,
      noremap = true,
    }
  }
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require("dap.ui.widgets");
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}


M.harpoon = {
  n = {
     ["<leader>z"] = {
      function ()
        local harpoon = require "harpoon"
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      "󱠿 Harpoon Menu",
    },
    ["<leader>a"] = {
      function ()
        local harpoon = require "harpoon"
        harpoon:list():append()
      end,
      "󱡁 Harpoon Add file",
    },
    ["<leader>j"] = {
      function ()
        local harpoon = require "harpoon"
        harpoon:list():select(1)
      end,
      "󱡁 Navigate to file 1",
    },
    ["<leader>k"] = {
      function ()
        local harpoon = require "harpoon"
        harpoon:list():select(2)
      end,
      "󱡁 Navigate to file 2",
    },
    ["<leader>l"] = {
      function ()
        local harpoon = require "harpoon"
        harpoon:list():select(3)
      end,
      "󱡁 Navigate to file 3",
    },
    ["<leader>;"] = {
      function ()
        local harpoon = require "harpoon"
        harpoon:list():select(4)
      end,
      "󱡁 Navigate to file 4",
    },
  }
}


M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function ()
        require("dap-go").debug_test()
      end,
      "Debug Go test"
    },
    ["<leader>dgl"] = {
      function ()
        require("dap-go").debug_last()
      end,
      "Debug last go test"
    }
  }
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoAddTag json <CR>",
      "Add JSON struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd> GoAddTag yaml <CR>",
      "Add YAML struct tags"
    },
    ["<leader>gf"] = {
      "<cmd> GoFillStruct <CR>",
      "Fill Go struct"
    },
  }
}

return M
