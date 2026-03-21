return {
  "github/copilot.vim",
  cmd = "Copilot",
  event = "InsertEnter",
  init = function()
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_assume_mapped = true
  end,
}
