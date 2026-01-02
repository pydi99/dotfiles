return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "rust",
        "markdown",
        "tsx",
        "javascript",
        "typescript",
        "cpp",
        "markdown",
        "markdown_inline",
      },
      highlight = {
        enable = true,
      },
    },
  },
  -- {
  --   "mrcjkb/rustaceanvim",
  --   version = "^5", -- Recommended
  --   lazy = false, -- This plugin is already lazy
  --   -- ["rust-analyzer"] = {
  --   --   cargo = {
  --   --     allFeatures = true,
  --   --   },
  --   -- },
  -- },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "html",
    },
    config = function()
      require("nvim-ts-autotag").setup()
      -- code
    end,
  },
  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = function()
      require("crates").setup {
        completion = {
          cmp = {
            enabled = true,
          },
        },
      }
      require("cmp").setup.buffer {
        sources = { { name = "crates" } },
      }
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  { "numToStr/Comment.nvim", enabled = false },
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has "nvim-0.10.0" == 1,
  },
  {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- Git features
      git = { enabled = true },
      lazygit = { enabled = true },
      gitbrowse = { enabled = true },

      -- Picker (telescope replacement)
      picker = { enabled = true },

      -- Notifications
      notifier = { enabled = true },

      -- Other useful features
      terminal = { enabled = true },
      bufdelete = { enabled = true },
      words = { enabled = true },
      rename = { enabled = true },
      explorer = { enabled = true },
      scratch = { enabled = true },
      quickfile = { enabled = true },
      scroll = { enabled = true },
      zen = { enabled = true },
      bigfile = { enabled = true },
      input = { enabled = true },
      surround = { enabled = true },
      indent = { enabled = true },

      -- Disabled (conflicts with NvChad)
      dashboard = { enabled = false },
      notify = { enabled = false },
    },
  },
  {
    "mg979/vim-visual-multi",
    lazy = false, -- so it loads immediately, not lazily
    -- you can optionally add config or keymappings here if you want
  },
}
