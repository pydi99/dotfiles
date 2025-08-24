require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- LSP: go to definition
map("n", "gd", function()
  local params = vim.lsp.util.make_position_params()
  vim.lsp.buf.definition(params)
end, { desc = "LSP Go to definition" })
