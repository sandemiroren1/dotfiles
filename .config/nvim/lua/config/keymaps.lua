-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- DAP (debugger)
map("n", "<leader>dt", function() require("dap").toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
map("n", "<leader>dc", function() require("dap").continue() end, { desc = "Continue" })
map("n", "<leader>di", function() require("dap").step_into() end, { desc = "Step Into" })
map("n", "<leader>do", function() require("dap").step_over() end, { desc = "Step Over" })
map("n", "<leader>du", function() require("dap").step_out() end, { desc = "Step Out" })
map("n", "<leader>dr", function() require("dap").repl.open() end, { desc = "Open REPL" })
map("n", "<leader>dl", function() require("dap").run_last() end, { desc = "Run Last" })
map("n", "<leader>dq", function() require("dap").terminate() end, { desc = "Terminate" })
map("n", "<leader>db", function() require("dap").list_breakpoints() end, { desc = "List Breakpoints" })
map("n", "<leader>de", function() require("dap").set_exception_breakpoints() end, { desc = "Exception Breakpoints" })
