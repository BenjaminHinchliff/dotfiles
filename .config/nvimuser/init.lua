return {
  colorscheme = "catppuccin",
  options = {
    o = {},
    g = {
      vimtex_view_general_viewer = "okular"
    },
  },
  plugins = {
    init = {
      {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
          require("catppuccin").setup {
            flavour = "mocha" -- mocha, macchiato, frappe, latte
          }
        end
      },
      {
        "lervag/vimtex"
      },
    },
  },
}
