-- require("nvchad.configs.lspconfig").defaults()
--
-- local nvlsp = require "nvchad.configs.lspconfig"
--
-- -- Simple server list
-- local servers = { "html", "cssls", "ts_ls", "tailwindcss", "eslint", "rust_analyzer", "clangd", "nixd" }
--
-- -- Setup each server
-- for _, lsp in ipairs(servers) do
--   require("lspconfig")[lsp].setup {
--     on_attach = nvlsp.on_attach,
--     on_init = nvlsp.on_init,
--     capabilities = nvlsp.capabilities,
--   }
-- end
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"

-- Define servers
local servers = { "html", "cssls", "ts_ls", "tailwindcss", "eslint", "rust_analyzer", "clangd", "nixd" }

-- Configure each server using vim.lsp.config (NEW API)
for _, server in ipairs(servers) do
  vim.lsp.config[server] = {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- Custom config for specific servers
vim.lsp.config.ts_ls = {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "typescript-language-server", "--stdio" },
  root_markers = { "package.json", "tsconfig.json", ".git" },
}

vim.lsp.config.rust_analyzer = {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml", "rust-project.json", ".git" },
  settings = {
    ["rust-analyzer"] = {
      cargo = { loadOutDirsFromCheck = true, allFeatures = true },
      procMacro = { enable = true },
      checkOnSave = { command = "clippy" },
    },
  },
}

vim.lsp.config.clangd = {
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_markers = { "compile_commands.json", "compile_flags.txt", ".git" },
}

vim.lsp.config.nixd = {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "nixd" },
  filetypes = { "nix" },
  root_markers = { "flake.nix", "default.nix", ".git" },
  settings = {
    nixd = { formatting = { command = { "nixpkgs-fmt" } } },
  },
}

-- Enable all configured servers
vim.lsp.enable(servers)
