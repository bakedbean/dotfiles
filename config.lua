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
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      {
        "JMarkin/nvim-tree.lua-float-preview",
        lazy = true,
        -- default
        opts = {
            -- Whether the float preview is enabled by default. When set to false, it has to be "toggled" on.
            toggled_on = false,
            -- wrap nvimtree commands
            wrap_nvimtree_commands = true,
            -- lines for scroll
            scroll_lines = 20,
            -- window config
            window = {
              style = "minimal",
              relative = "win",
              border = "rounded",
              wrap = false,
            },
            mapping = {
              -- scroll down float buffer
              down = { "<C-d>" },
              -- scroll up float buffer
              up = { "<C-e>", "<C-u>" },
              -- enable/disable float windows
              toggle = { "<C-c>" },
            },
            -- hooks if return false preview doesn't shown
            hooks = {
              pre_open = function(path)
                local is_showed = require("float-preview.utils").is_showed(path)
                if is_showed then
                  return false
                end
                -- if file > 5 MB or not text -> not preview
                local size = require("float-preview.utils").get_size(path)
                if type(size) ~= "number" then
                  return false
                end
                local is_text = require("float-preview.utils").is_text(path)
                return size < 5 and is_text
              end,
              post_open = function(bufnr)
                return true
              end,
            },
          },
        },
      },
    },
  }

lvim.builtin.nvimtree.setup.on_attach = function(bufnr)
  local api = require("nvim-tree.api")
  local FloatPreview = require("float-preview")

  FloatPreview.attach_nvimtree(bufnr)
  local close_wrap = FloatPreview.close_wrap

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  --vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
  --vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  -- Add your custom mappings here
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))

  vim.keymap.set("n", "<C-t>", close_wrap(api.node.open.tab), opts("Open: New Tab"))
  vim.keymap.set("n", "<C-v>", close_wrap(api.node.open.vertical), opts("Open: Vertical Split"))
  vim.keymap.set("n", "<C-s>", close_wrap(api.node.open.horizontal), opts("Open: Horizontal Split"))
  vim.keymap.set("n", "<CR>", close_wrap(api.node.open.edit), opts("Open"))
  vim.keymap.set("n", "<Tab>", close_wrap(api.node.open.preview), opts("Open"))
  vim.keymap.set("n", "o", close_wrap(api.node.open.edit), opts("Open"))
  vim.keymap.set("n", "O", close_wrap(api.node.open.no_window_picker), opts("Open: No Window Picker"))
  vim.keymap.set("n", "a", close_wrap(api.fs.create), opts("Create"))
  vim.keymap.set("n", "d", close_wrap(api.fs.remove), opts("Delete"))
  vim.keymap.set("n", "r", close_wrap(api.fs.rename), opts("Rename"))
end

lvim.transparent_window = true
lvim.builtin.lualine.options.theme = "nord"
lvim.colorscheme = "nordic"

lvim.keys.insert_mode["jk"] = "<Esc>"
lvim.keys.insert_mode["<C-l>"] = "<C-o>l"
lvim.keys.insert_mode["<C-h>"] = "<C-o>h"

local mode_map = {
  ['NORMAL'] = '',
  ['O-PENDING'] = 'N?',
  ['INSERT'] = '',
  ['VISUAL'] = '',
  ['V-BLOCK'] = 'VB',
  ['V-LINE'] = 'VL',
  ['V-REPLACE'] = 'VR',
  ['REPLACE'] = 'R',
  ['COMMAND'] = '!',
  ['SHELL'] = 'SH',
  ['TERMINAL'] = 'T',
  ['EX'] = 'X',
  ['S-BLOCK'] = 'SB',
  ['S-LINE'] = 'SL',
  ['SELECT'] = 'S',
  ['CONFIRM'] = 'Y?',
  ['MORE'] = 'M',
}

lvim.builtin.lualine.sections.lualine_a = { {'mode', fmt = function(s) return mode_map[s] or s end} }
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

lvim.builtin.gitsigns.opts = {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '-' }
  },
}

lvim.builtin.telescope.defaults.layout_strategy = 'vertical'
lvim.builtin.telescope.pickers = {
  find_files = {
    layout_config = {
      width = 0.95,
      height = 0.95,
      preview_height = 0.7,
    },
  },
  git_files = {
    layout_config = {
      width = 0.95,
      height = 0.95,
    },
  },
  grep_string = {
    layout_config = {
      width = 0.95,
      height = 0.95,
    },
  },
  live_grep = {
    layout_config = {
      width = 0.95,
    },
  },
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
