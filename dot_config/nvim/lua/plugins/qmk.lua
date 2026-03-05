return {
  "codethread/qmk.nvim",
  -- beekeeb Toucan: 42-key split (3x6 + 3 thumb keys per side), ZMK firmware
  ft = { "devicetree" },
  opts = {
    name = "LAYOUT_split_3x6_3",
    variant = "zmk",
    auto_format_pattern = "*.keymap",
    layout = {
      "x x x x x x _ x x x x x x",
      "x x x x x x _ x x x x x x",
      "x x x x x x _ x x x x x x",
      "_ _ _ x x x _ x x x _ _ _",
    },
  },
}
