return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    cmd = { "ConformInfo" },
    opts = require "configs.conform",
    async = true,
    keys = {
      {
        "<leader>mp",
        function()
          require("conform").format {
            async = true,
            lsp_fallback = true,
          }
        end,
        desc = "[M]ake [P]retty",
      },
    },
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    config = function()
      local treesitter = require "nvim-treesitter.configs"

      treesitter.setup {
        highlight = {
          enable = true,
        },
        indent = { enable = true },
        context_commentstring = {
          enable = true,
        },
        ensure_installed = {
          "vim",
          "lua",
          "luadoc",
          "vimdoc",
          "html",
          "css",
          "rust",
          "typescript",
          "javascript",
          "tsx",
          "json",
          "prisma",
          "gitignore",
          "markdown",
          "markdown_inline",
          "dockerfile",
          "graphql",
          "query",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "+",
            node_incremental = "+",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    ensure_installed = {
      "lua-language-server",
      "typescript-language-server",
      "prettier",
    },
  },
}
