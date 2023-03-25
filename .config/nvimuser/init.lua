return {
  colorscheme = "gruvbox",
  highlights = {
    gruvbox = {
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
    ["server-settings"] = {
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              allTargets = true,
            },
          },
        },
      },
    },
  },
  plugins = {
    {
      "ellisonleao/gruvbox.nvim",
      -- name = "catppuccin",
      -- config = function()
      --   require("catppuccin").setup {
      --     flavour = "mocha" -- mocha, macchiato, frappe, latte
      --   }
      -- end
    },
    {
      "lervag/vimtex"
    },
    {
      "elkowar/yuck.vim"
    },
    {

    },
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
        opts.section.header.opts.hl = "GruvboxOrange"
      end,
    },
  },
}
