local options = {
  lsp_fallback = true,
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettierd" },
    html = { "prettierd" },
    javascript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
  },

  format_on_save = false,
  -- {
  --   -- These options will be passed to conform.format()
  --   enable = false,
  --   timeout_ms = 10000,
  --   -- async = true,
  --   lsp_fallback = true,
  -- },
}

return options
