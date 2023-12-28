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
    formatting = {
      -- timeout_ms = 3200,
    },
    servers = {
      "racket_langserver",
    },
    config = {
      texlab = {
        settings = {
          texlab = {
            build = {
              executable = "latexmk",
              args = { "-pdf", "-xelatex", "-interaction=nonstopmode", "-synctex=1", "%f" },
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
    -- {
    --   "lervag/vimtex",
    --   init = function()
    --     vim.g.maplocalleader = ";"
    --   end,
    --   event = "BufRead *.tex",
    -- },
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
      "nvim-neorg/neorg",
      build = ":Neorg sync-parsers",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require("neorg").setup {
          load = {
            ["core.defaults"] = {},  -- Loads default behaviour
            ["core.concealer"] = {}, -- Adds pretty icons to your documents
            ["core.export"] = {},
            ["core.dirman"] = {      -- Manages Neorg workspaces
              config = {
                workspaces = {
                  notes = "~/notes",
                },
              },
            },
          },
        }
      end,
      ft = "norg",
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
    { -- override nvim-autopairs plugin
      "windwp/nvim-autopairs",
      opts = {
        enable_check_bracket_line = false,
      },
    },
    {
      "pest-parser/pest.vim",
      ft = "pest",
    },
  },
}
