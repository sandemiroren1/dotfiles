-- Ensure cargo binaries (tree-sitter) are available to Neovim
vim.env.PATH = vim.env.HOME .. "/.cargo/bin:" .. vim.env.PATH

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
