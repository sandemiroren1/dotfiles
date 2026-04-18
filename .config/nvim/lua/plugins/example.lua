-- 1️⃣ Core LazyVim plugins first
-- add other extras here if needed

-- 3️⃣ Your custom plugins last
return {
  -- Theme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Disable mini.starter (fix crash)
  { "nvim-mini/mini.starter", enabled = false },

  -- Trouble disabled
  { "folke/trouble.nvim", enabled = false },

  -- CMP emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  -- Telescope tweaks
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin File",
      },
    },
  },

  -- LSP (pyright, clangd, tsserver via extras)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
        clangd = {},
        hls = {},
        texlab = {},
      },
    },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
      })
    end,
  },

  -- Mason (install only packages Mason knows)
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server", -- LSP
        "prettier",
        "eslint_d",
        "lua-language-server",
        "pyright",
      },
    },
  },
}
