return {
  "dlants/magenta.nvim",
  lazy = false, -- you could also bind to <leader>mt
  build = "npm install --frozen-lockfile",
  opts = {
    sidebarPosition = "right",
    chimeVolume = 0.0, -- Disable chime sound (set to 0.3 for 30% volume if you want it enabled)
    profiles = {
      {
        name = "claude-max",
        provider = "anthropic",
        model = "claude-opus-4-1-20250805",
        fastModel = "claude-sonnet-4-20250514",
        authType = "max", -- Use Anthropic OAuth instead of API key
        -- No apiKeyEnvVar needed for max auth
      },
    },
  },
}
