return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = function(_, opts)
    -- Other blankline configuration here
    return require("indent-rainbowline").make_opts(opts, {
      -- Customize the transparency (0 = invisible, 1 = fully opaque)
      color_transparency = 0.15,
      -- Customize the colors (24-bit hex values)
      colors = {
        0x4a5568, -- Dark gray-blue
        0x5a6c7d, -- Medium gray-blue
        0x6b7d8c, -- Lighter gray-blue
        0x7c8fa1, -- Light gray-blue
        0x8da0b6, -- Pale blue-gray
        0x9eb1cb, -- Very pale blue-gray
      },
    })
  end,
  dependencies = {
    "TheGLander/indent-rainbowline.nvim",
  },
}
