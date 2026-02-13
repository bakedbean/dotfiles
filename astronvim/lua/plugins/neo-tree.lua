return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      width = 40,
      -- Customize the window separator/border
      -- Options: "single", "double", "rounded", "solid", "shadow", or custom array
      -- border = "single",
    },
    default_component_configs = {
      file_size = {
        enabled = true,
        required_width = 30, -- only show file size when width is at least 30
      },
    },
    filesystem = {
      filtered_items = {
        visible = true, -- Show hidden files
        hide_dotfiles = false, -- Don't hide dotfiles
        hide_gitignored = false, -- Show gitignored files
      },
    },
  },
}
