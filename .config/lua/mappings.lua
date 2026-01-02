-- stylua: ignore file
require "nvchad.mappings"
local map = vim.keymap.set
local snacks = require "snacks"

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- stylua: ignore start
-- Quick Access (SUPER USEFUL)
map("n", "<leader><space>", function() snacks.picker.smart() end, { desc = "Smart Find Files" })
map("n", "<leader>:", function() snacks.picker.command_history() end, { desc = "Command History" })

-- File Finding
map("n", "<leader>ff", function() snacks.picker.files() end, { desc = "Find Files" })
map("n", "<leader>fg", function() snacks.picker.git_files() end, { desc = "Find Git Files" })
map("n", "<leader>fr", function() snacks.picker.recent() end, { desc = "Recent Files" })
map("n", "<leader>fc", function() snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find Config File" })
map("n", "<leader>fb", function() snacks.picker.buffers() end, { desc = "Find Buffers" })

-- Grep/Search
map("n", "<leader>sg", function() snacks.picker.grep() end, { desc = "Live Grep" })
map({ "n", "x" }, "<leader>sw", function() snacks.picker.grep_word() end, { desc = "Grep Word/Selection" })
map("n", "<leader>sb", function() snacks.picker.lines() end, { desc = "Search Buffer Lines" })
map("n", "<leader>sB", function() snacks.picker.grep_buffers() end, { desc = "Grep Open Buffers" })

-- Git (VERY USEFUL)
-- Git (COMPLETE)
map("n", "<leader>gg", function() snacks.lazygit() end, { desc = "Lazygit" })
map("n", "<leader>gs", function() snacks.picker.git_status() end, { desc = "Git Status" })
map("n", "<leader>gl", function() snacks.picker.git_log() end, { desc = "Git Log" })
map("n", "<leader>gL", function() snacks.picker.git_log_line() end, { desc = "Git Log Line (current line)" })
map("n", "<leader>gf", function() snacks.picker.git_log_file() end, { desc = "Git Log File" })
map("n", "<leader>gd", function() snacks.picker.git_diff() end, { desc = "Git Diff (Hunks)" })
map("n", "<leader>gb", function() snacks.picker.git_branches() end, { desc = "Git Branches" })
map("n", "<leader>gS", function() snacks.picker.git_stash() end, { desc = "Git Stash" })
map({ "n", "v" }, "<leader>gB", function() snacks.gitbrowse() end, { desc = "Git Browse (Open in Browser)" })
map("n", "<leader>gi", function() snacks.picker.gh_issue() end, { desc = "GitHub Issues (open)" })
map("n", "<leader>gI", function() snacks.picker.gh_issue({ state = "all" }) end, { desc = "GitHub Issues (all)" })
map("n", "<leader>gp", function() snacks.picker.gh_pr() end, { desc = "GitHub Pull Requests (open)" })
map("n", "<leader>gP", function() snacks.picker.gh_pr({ state = "all" }) end, { desc = "GitHub Pull Requests (all)" })

-- LSP Navigation (Better than default!)
map("n", "gd", function() snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
map("n", "gr", function() snacks.picker.lsp_references() end, { desc = "References" })
map("n", "gI", function() snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
map("n", "gy", function() snacks.picker.lsp_type_definitions() end, { desc = "Goto Type Definition" })
map("n", "<leader>ss", function() snacks.picker.lsp_symbols() end, { desc = "LSP Symbols (Outline)" })
map("n", "<leader>sd", function() snacks.picker.diagnostics() end, { desc = "Diagnostics" })
map("n", "<leader>sD", function() snacks.picker.diagnostics_buffer() end, { desc = "Buffer Diagnostics" })

-- Useful Utilities
map("n", "<leader>su", function() snacks.picker.undo() end, { desc = "Undo History" })
map("n", "<leader>sj", function() snacks.picker.jumps() end, { desc = "Jump List" })
map("n", "<leader>sm", function() snacks.picker.marks() end, { desc = "Marks" })
map("n", "<leader>sk", function() snacks.picker.keymaps() end, { desc = "Keymaps" })
map("n", "<leader>sh", function() snacks.picker.help() end, { desc = "Help Pages" })
map("n", "<leader>sc", function() snacks.picker.commands() end, { desc = "Commands" })
map("n", "<leader>sR", function() snacks.picker.resume() end, { desc = "Resume Last Picker" })

-- Notifications
map("n", "<leader>n", function() snacks.notifier.show_history() end, { desc = "Notification History" })
map("n", "<leader>un", function() snacks.notifier.hide() end, { desc = "Dismiss Notifications" })

-- Terminal
map("n", "<c-/>", function() snacks.terminal() end, { desc = "Toggle Terminal" })
map("n", "<c-_>", function() snacks.terminal() end, { desc = "which_key_ignore" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- Buffer & File Management
map("n", "<leader>bd", function() snacks.bufdelete() end, { desc = "Delete Buffer" })
map("n", "<leader>e", function() snacks.explorer() end, { desc = "File Explorer" })

-- Scratch & Zen
map("n", "<leader>.", function() snacks.scratch() end, { desc = "Toggle Scratch Buffer" })
map("n", "<leader>S", function() snacks.scratch.select() end, { desc = "Select Scratch Buffer" })
map("n", "<leader>z", function() snacks.zen() end, { desc = "Toggle Zen Mode" })
map("n", "<leader>Z", function() snacks.zen.zoom() end, { desc = "Toggle Zoom" })

-- Rename
map("n", "<leader>rn", function() snacks.rename.rename_file() end, { desc = "Rename" })

-- Word Navigation
map({ "n", "t" }, "]]", function() snacks.words.jump(vim.v.count1) end, { desc = "Next Reference" })
map({ "n", "t" }, "[[", function() snacks.words.jump(-vim.v.count1) end, { desc = "Prev Reference" })
-- stylua: ignore end
