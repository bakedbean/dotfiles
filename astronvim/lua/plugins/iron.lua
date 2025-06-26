return {
  "Vigemus/iron.nvim",
  cmd = { "IronRepl", "IronRestart", "IronFocus", "IronHide" },
  opts = function()
    local iron = require "iron.core"
    local view = require "iron.view"
    return {
      config = {
        -- Whether a repl should be discarded or not
        scratch_repl = true,
        -- Your repl definitions come here
        repl_definition = {
          python = {
            command = { "ipython", "--no-autoindent" },
            format = require("iron.fts.common").bracketed_paste_python,
          },
          sh = {
            -- Can be a table or a function that
            -- returns a table (see below)
            command = { "zsh" },
          },
          lua = {
            command = { "lua" },
          },
        },
        -- How the repl window will be displayed
        repl_open_cmd = "botright 20split",
      },
      -- Iron doesn't set keymaps by default anymore.
      -- You can set them here or manually add keymaps to the functions in iron.core
      keymaps = {
        send_motion = "<space>sc",
        visual_send = "<space>sc",
        send_file = "<space>sf",
        send_line = "<space>sl",
        send_paragraph = "<space>sp",
        send_until_cursor = "<space>su",
        send_mark = "<space>sm",
        mark_motion = "<space>mc",
        mark_visual = "<space>mc",
        remove_mark = "<space>md",
        cr = "<space>s<cr>",
        interrupt = "<space>s<space>",
        exit = "<space>sq",
        clear = "<space>cl",
      },
      -- If the highlight is on, you can change how it looks
      -- For the available options, check nvim_set_hl
      highlight = {
        italic = true,
      },
      ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
    }
  end,
  config = function(_, opts)
    local iron = require "iron.core"
    iron.setup(opts)
  end,
  keys = {
    { "<space>rr", "<cmd>IronRepl<cr>", desc = "Toggle REPL" },
    { "<space>rR", "<cmd>IronRestart<cr>", desc = "Restart REPL" },
    { "<space>rf", "<cmd>IronFocus<cr>", desc = "Focus REPL" },
    { "<space>rh", "<cmd>IronHide<cr>", desc = "Hide REPL" },
  },
}
