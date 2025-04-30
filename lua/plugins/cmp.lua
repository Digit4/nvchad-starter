return {
  "saghen/blink.cmp",
  event = "VimEnter",
  -- dependencies = {  'L3MON4D3/LuaSnip',version = '2.*',build =(function()
  --   if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
  --           return
  --         end
  --         return 'make install_jsregexp'
  -- ) ,
  dependencies = { "rafamadriz/friendly-snippets" },

  version = "1.*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    fuzzy = { implementation = "prefer_rust" },

    completion = { menu = { auto_show = true }, documentation = { auto_show = false } },

    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = "super-tab" },

    appearance = {
      nerd_font_variant = "mono",
    },

    -- (Default) Only show the documentation popup when manually triggered
  },
  opts_extend = { "sources.default" },
}
