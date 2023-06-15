return {
  colorscheme = "catppuccin",
  highlights = {
    init = {
      Crab = { fg = "#F74C00" },
      CmpItemKindCopilot = { fg = "#a6e3a1" },
    },
    gruvbox = {
      CmpItemKindCopilot = { fg = "#b8bb26" },
      StatusLine = { fg = "#ebdbb2", bg = "#504945" },
    },
  },
  options = {
    o = {},
    g = {
      vimtex_view_general_viewer = "okular"
    },
  },
  lsp = {
    config = {
      texlab = {
        settings = {
          texlab = {
            build = {
              onSave = true,
            }
          }
        }
      }
    }
  },
  plugins = {
    {
      "catppuccin/nvim",
      as = "catppuccin",
      opts = {
        flavour = "mocha" -- mocha, macchiato, frappe, latte
      },
      config = function()
        require("catppuccin").setup()
      end
    },
    {
      "lervag/vimtex",
      init = function()
        vim.g.maplocalleader = ";"
      end,
      event = "BufRead *.tex",
    },
    {
      "elkowar/yuck.vim"
    },
    {
      "folke/neoconf.nvim",
      event = "VimEnter",
    },
    -- {
    --   "dhruvasagar/vim-table-mode",
    --   event = "BufRead",
    -- },
    {
      "lambdalisue/suda.vim",
      lazy = false,
    },
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "InsertEnter",
      config = function()
        require("copilot").setup({
          suggestion = { enabled = false },
          panel = { enabled = false },
        })
      end
    },
    {
      "zbirenbaum/copilot-cmp",
      dependencies = { "copilot.lua" },
      event = "InsertEnter",
      config = function()
        require("copilot_cmp").setup({})
      end,
    },
    {
      "onsails/lspkind.nvim",
      opts = {
        symbol_map = { Copilot = "" }
      }
    },
    {
      -- override nvim-cmp plugin
      "hrsh7th/nvim-cmp",
      dependencies = {
        "zbirenbaum/copilot-cmp", -- add cmp source as dependency of cmp
      },
      -- override the options table that is used in the `require("cmp").setup()` call
      opts = function(_, opts)
        -- opts parameter is the default options table
        -- the function is lazy loaded so cmp is able to be required
        local cmp = require "cmp"
        -- modify the sources part of the options table
        opts.sources = cmp.config.sources {
          { name = "nvim_lsp", priority = 1000 },
          { name = "luasnip",  priority = 750 },
          { name = "copilot",  priority = 625 },
          { name = "buffer",   priority = 500 },
          { name = "path",     priority = 250 },
        }

        -- return the new table to be used
        return opts
      end,
    },
    -- {
    --   "chrisbra/csv.vim",
    --   event = "BufEnter *.csv"
    -- },
    {
      "nvim-treesitter/nvim-treesitter",
      dependencies = { "HiPhish/nvim-ts-rainbow2" },
      opts = function(_, opts)
        opts.rainbow = {
          enable = true,
          disable = { "html" },
          extended_mode = false,
          max_file_lines = nil,
        }
      end
    },
    {
      "goolord/alpha-nvim",
      opts = function(_, opts)
        opts.section.header.val = {
          "                            ,▄,  ▄▓▄  ,▄",
          "                        █▄µ ███▓▄███▄▓███ ╓▄█",
          "                   ╒▄▄µ▄█████████████████████▄╓▄▄▄",
          "    ,           ,  ▐█████████████████████████████▌  ,        ╓▄▌",
          " ▄─ ▐██▄       ▐█████████████████████████████████████H     ▄███H  ▄█",
          "███  ████   ,▄▄╓█████████████████████████████████████╓▄▄  ▐████┐,▄██",
          "████▄████▌  ▐███████████████████████████████████████████┘ ▐████████▀",
          "`▀███████¬,╓▄██████████████████████████████████████████▌▄╓,▀█████▀",
          "   ╙▀███─ ▀███████████████████▀▀████████▀▀████████████████▀J██▀╙",
          "      ▀██▓▄██████████████████▓▓  ██████▓▓  ██████████████████└",
          "        ▐████████████████████    ██████    █████████████████▄",
          "       ▄██████████████████████▄▄████████▄▄█████████████▀██████H",
          "       ²▀███ ╙▓▄\"╙▀▀██████████████▄  ▄███████████▓▀▀╙  ▓▀ ███┘",
          "         `▀██µ ▀▄      `╙╙╙▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀╙\"╙`       ▓┘ ▓█▀",
          "            ▀█▄ `N                                   Å  ▄█╜",
          "              ▀█                                       ▄▀",
          "                ╨                                      ╙",
        }
        opts.section.header.opts.hl = "Crab"
      end,
    },
  },
}
