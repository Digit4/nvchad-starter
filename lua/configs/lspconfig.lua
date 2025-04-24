require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "ts_ls", "lua_ls" }
vim.lsp.enable(servers)
