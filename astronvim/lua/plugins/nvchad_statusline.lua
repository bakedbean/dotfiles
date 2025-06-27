return {
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      -- add new user interface icon
      icons = {
        VimIcon = "",
        ScrollText = "",
        GitBranch = "",
        GitAdd = "+",
        GitChange = "~",
        GitDelete = "-",
      },
      -- modify variables used by heirline but not defined in the setup call directly
      status = {
        -- define the separators between each section
        separators = {
          left = { "", "" }, -- separator for the left side of the statusline
          right = { " ", "" }, -- separator for the right side of the statusline
          tab = { "", "" },
        },
        -- add new colors that can be used by heirline
        colors = function(hl)
          local get_hlgroup = require("astroui").get_hlgroup
          -- use helper function to get highlight group properties
          local comment_fg = get_hlgroup("Comment").fg
          hl.git_branch_fg = comment_fg
          hl.git_added = comment_fg
          hl.git_changed = comment_fg
          hl.git_removed = comment_fg
          hl.blank_bg = get_hlgroup("Folded").fg
          hl.file_info_bg = get_hlgroup("Visual").bg
          hl.nav_icon_bg = get_hlgroup("String").fg
          hl.nav_fg = hl.nav_icon_bg
          hl.folder_icon_bg = get_hlgroup("Error").fg
          return hl
        end,
        attributes = {
          mode = { bold = true },
        },
        icon_highlights = {
          file_icon = {
            statusline = false,
          },
        },
      },
    },
  },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astroui.status"
      opts.statusline = {
        -- default highlight for the entire statusline
        hl = { fg = "fg", bg = "bg" },
        -- each element following is a component in astroui.status module

        -- add the vim mode component
        status.component.mode {
          -- enable mode text with padding as well as an icon before it
          mode_text = {
            icon = { kind = "VimIcon", padding = { right = 1, left = 1 } },
          },
          -- surround the component with a separators
          surround = {
            -- it's a left element, so use the left separator
            separator = "left",
            -- set the color of the surrounding based on the current mode using astronvim.utils.status module
            color = function()
              local mode = vim.fn.mode()
              -- Use custom color for Normal mode
              if mode == "n" then
                return { main = "#ff6c00", right = "blank_bg" }
              else
                return { main = status.hl.mode_bg(), right = "blank_bg" }
              end
            end,
          },
        },
        -- we want an empty space here so we can use the component builder to make a new section with just an empty string
        status.component.builder {
          { provider = "" },
          -- define the surrounding separator and colors to be used inside of the component
          -- and the color to the right of the separated out section
          surround = {
            separator = "left",
            color = { main = "blank_bg", right = "file_info_bg" },
          },
        },
        -- add a section for the currently opened file information with full path
        status.component.file_info {
          -- enable the file_icon and disable the highlighting based on filetype
          filename = {
            fallback = "[No Name]",
            modify = ":.",  -- Show path relative to cwd
            padding = { left = 0 },
          },
          file_icon = { padding = { right = 1 } },
          -- add file flags (modified, readonly, etc.)
          file_modified = { str = "●", padding = { left = 1 } },
          file_read_only = { str = "", padding = { left = 1 } },
          -- disable filetype here since we'll add it separately
          filetype = false,
          -- add padding
          padding = { right = 1 },
          -- define the section separator
          surround = { separator = "left", condition = false },
        },
        -- add file type component
        status.component.builder {
          {
            provider = function()
              local ft = vim.bo.filetype
              if ft == "" then return "" end
              return "[" .. ft:upper() .. "]"
            end,
            condition = function() return vim.bo.filetype ~= "" end,
          },
          hl = { fg = "file_info_bg", bg = "bg" },
          padding = { left = 1, right = 1 },
          surround = { separator = "none" },
        },
        -- add a component for the current git branch if it exists and use no separator for the sections
        status.component.git_branch {
          git_branch = { padding = { left = 1 } },
          surround = { separator = "none" },
        },
        -- add a component for the current git diff if it exists and use no separator for the sections
        status.component.git_diff {
          padding = { left = 1 },
          surround = { separator = "none" },
        },
        -- fill the rest of the statusline
        -- the elements after this will appear in the middle of the statusline
        status.component.fill(),
        -- fill the rest of the statusline
        -- the elements after this will appear on the right of the statusline
        status.component.fill(),
        -- add a component for the current diagnostics if it exists and use the right separator for the section
        status.component.diagnostics { surround = { separator = "right" } },
        -- add a component to display virtual environment if available
        status.component.builder {
          {
            provider = function()
              local venv = vim.env.VIRTUAL_ENV or vim.env.CONDA_DEFAULT_ENV
              if venv then
                local venv_name = vim.fn.fnamemodify(venv, ":t")
                return " " .. venv_name
              end
              return ""
            end,
            condition = function() return vim.env.VIRTUAL_ENV or vim.env.CONDA_DEFAULT_ENV end,
          },
          hl = { fg = "fg", bg = "bg" },
          surround = { separator = "none" },
        },
        -- add a component to display LSP clients, disable showing LSP progress, and use the right separator
        status.component.lsp {
          lsp_progress = false,
          surround = { separator = "right" },
        },
        -- NvChad has some nice icons to go along with information, so we can create a parent component to do this
        -- all of the children of this table will be treated together as a single component
        {
          -- define a simple component where the provider is just a folder icon
          status.component.builder {
            -- astronvim.get_icon gets the user interface icon for a closed folder with a space after it
            { provider = require("astroui").get_icon "FolderClosed" },
            -- add padding after icon
            padding = { right = 1 },
            -- set the foreground color to be used for the icon
            hl = { fg = "bg" },
            -- use the right separator and define the background color
            surround = { separator = "right", color = "folder_icon_bg" },
          },
          -- add a file information component and only show the current working directory name
          status.component.file_info {
            -- we only want filename to be used and we can change the fname
            -- function to get the current working directory name
            filename = {
              fname = function(nr) return vim.fn.getcwd(nr) end,
              padding = { left = 1 },
            },
            -- disable all other elements of the file_info component
            filetype = false,
            file_icon = false,
            file_modified = false,
            file_read_only = false,
            -- use no separator for this part but define a background color
            surround = {
              separator = "none",
              color = "file_info_bg",
              condition = false,
            },
          },
        },
        -- the final component of the NvChad statusline is the navigation section
        -- this is very similar to the previous current working directory section with the icon
        { -- make nav section with icon border
          -- define a custom component with just a file icon
          status.component.builder {
            { provider = require("astroui").get_icon "ScrollText" },
            -- add padding after icon
            padding = { right = 1 },
            -- set the icon foreground
            hl = { fg = "bg" },
            -- use the right separator and define the background color
            -- as well as the color to the left of the separator
            surround = {
              separator = "right",
              color = { main = "nav_icon_bg", left = "file_info_bg" },
            },
          },
          -- add a navigation component with line numbers and percentage
          status.component.nav {
            -- add some padding for the percentage provider
            percentage = { padding = { right = 1 } },
            -- disable the default ruler
            ruler = false,
            scrollbar = false,
            -- use no separator and define the background color
            surround = { separator = "none", color = "file_info_bg" },
          },
          -- add custom component to show current line / total lines
          status.component.builder {
            {
              provider = function()
                local current_line = vim.fn.line "."
                local total_lines = vim.fn.line "$"
                return string.format("%d/%d", current_line, total_lines)
              end,
            },
            padding = { left = 1, right = 1 },
            hl = { fg = "fg", bg = "file_info_bg" },
            surround = { separator = "none", color = "file_info_bg" },
          },
          -- Alternative: show line:column format with total lines
          -- status.component.builder {
          --   {
          --     provider = function()
          --       local current_line = vim.fn.line(".")
          --       local current_col = vim.fn.col(".")
          --       local total_lines = vim.fn.line("$")
          --       return string.format("%d:%d/%d", current_line, current_col, total_lines)
          --     end,
          --   },
          --   padding = { left = 1, right = 1 },
          --   hl = { fg = "fg", bg = "file_info_bg" },
          --   surround = { separator = "none", color = "file_info_bg" },
          -- },
        },
      }
    end,
  },
}
