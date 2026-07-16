return {
  "mrcjkb/rustaceanvim",
  opts = function(_, opts)
    -- keep LazyVim's on_attach (<leader>cR, <leader>dr) and add extra rust keymaps
    local prev_attach = opts.server and opts.server.on_attach
    opts.server = opts.server or {}
    opts.server.on_attach = function(client, bufnr)
      if prev_attach then
        prev_attach(client, bufnr)
      end
      local map = function(lhs, cmd, desc)
        vim.keymap.set("n", lhs, function()
          vim.cmd.RustLsp(cmd)
        end, { buffer = bufnr, desc = desc })
      end
      map("<leader>ce", "expandMacro", "Expand Macro (Rust)")
      map("<leader>cX", "explainError", "Explain Error (Rust)")
      map("<leader>cD", "renderDiagnostic", "Render Diagnostic (Rust)")
      map("<leader>ct", "openCargo", "Open Cargo.toml (Rust)")
      map("<leader>cm", "parentModule", "Parent Module (Rust)")
      map("J", "joinLines", "Join Lines (Rust-aware)")
    end

    opts.server.default_settings = vim.tbl_deep_extend("force", opts.server.default_settings or {}, {
      ["rust-analyzer"] = {
        check = { command = "clippy" },
        inlayHints = {
          closureReturnTypeHints = { enable = "always" },
          lifetimeElisionHints = { enable = "always", useParameterNames = true },
          bindingModeHints = { enable = true },
        },
        completion = {
          fullFunctionSignatures = { enable = true },
          termSearch = { enable = true },
        },
      },
    })
    return opts
  end,
}
