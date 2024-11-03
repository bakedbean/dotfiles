-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
lvim.plugins = {
  { "lunarvim/colorschemes" },
  { "rebelot/kanagawa.nvim" },
  { "shaunsingh/nord.nvim" },
  { "alexvzyl/nordic.nvim" },
  { "lewpoly/sherbet.nvim" },
  { "fenetikm/falcon" },
  { "fcancelinha/nordern.nvim" },
  { "metalelf0/jellybeans-nvim" },
  {
    "windwp/nvim-ts-autotag",
    config = function ()
      require("nvim-ts-autotag").setup()
    end
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  {
    'wfxr/minimap.vim',
    build = "cargo install --locked code-minimap",
    -- cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
    config = function ()
      vim.cmd ("let g:minimap_width = 20")
      vim.cmd ("let g:minimap_auto_start = 0")
      vim.cmd ("let g:minimap_auto_start_win_enter = 0")
    end,
  },
  {
    "tpope/vim-surround",

    -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
    -- setup = function()
      --  vim.o.timeoutlen = 500
    -- end
  },
  {
  "tpope/vim-rails",
    cmd = {
      "Eview",
      "Econtroller",
      "Emodel",
      "Smodel",
      "Sview",
      "Scontroller",
      "Vmodel",
      "Vview",
      "Vcontroller",
      "Tmodel",
      "Tview",
      "Tcontroller",
      "Rails",
      "Generate",
      "Runner",
      "Extract"
    }
  },
}

lvim.transparent_window = true
lvim.builtin.lualine.options.theme = "nord"
lvim.colorscheme = "nordic"

lvim.keys.insert_mode["jk"] = "<Esc>"
lvim.keys.insert_mode["<C-l>"] = "<C-o>l"
lvim.keys.insert_mode["<C-h>"] = "<C-o>h"

lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = { "branch", "diff"}
lvim.builtin.lualine.options = {
  icons_enabled = true,
  section_separators = { left = '\u{e0b0}', right = '\u{e0b2}' },
  component_separators = { left = '\u{e0b1}', right = '\u{e0b3}' }
}

lvim.builtin.lualine.sections.lualine_c = {
  {
    'filename',
    path = 1
  }
}

vim.api.nvim_create_autocmd({"BufNewFile", "BufReadPost"}, {
  callback = function(args)
    if vim.fn.expand "%:p" ~= "" then
      vim.api.nvim_del_autocmd(args.id)
      vim.cmd "noautocmd NvimTreeOpen"
      vim.schedule(function()
        vim.cmd "wincmd p"
      end)
    end
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})

local colors = {
  color2 = "#0f1419",
  color3 = "#ffee99",
  color4 = "#e6e1cf",
  color5 = "#14191f",
  color13 = "#ff6600",
  color10 = "#FFA500",
  color8 = "#f07178",
  color9 = "#FFA500",
  none = "none",
}

lvim.builtin.lualine.options.theme = {
  normal = {
    c = { fg = colors.color9, bg = colors.color2 },
    a = { fg = colors.color2, bg = colors.color10, gui = "bold" },
    b = { fg = colors.color4, bg = colors.none },
  },
  insert = {
    a = { fg = colors.color2, bg = colors.color13, gui = "bold" },
    b = { fg = colors.color4, bg = colors.none },
  },
  visual = {
    a = { fg = colors.color2, bg = colors.color3, gui = "bold" },
    b = { fg = colors.color4, bg = colors.none },
  },
  replace = {
    a = { fg = colors.color2, bg = colors.color8, gui = "bold" },
    b = { fg = colors.color4, bg = colors.none },
  },
  inactive = {
    c = { fg = colors.color4, bg = colors.color2 },
    a = { fg = colors.color4, bg = colors.none, gui = "bold" },
    b = { fg = colors.color4, bg = colors.none },
  },
}
