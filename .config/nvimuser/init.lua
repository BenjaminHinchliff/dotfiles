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
    {
      "lambdalisue/suda.vim",
      lazy = false,
    },
    {
      "nvim-treesitter/nvim-treesitter",
      -- dependencies = { "HiPhish/nvim-ts-rainbow2" },
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
