-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
vim.api.nvim_create_autocmd("BufEnter", {
  command = "set nornu nu",
})

-- Auto-reload: watch cwd for file changes and reload buffers
require("custom.directory-watcher").setup({ path = vim.fn.getcwd() })
require("custom.hotreload").setup()
