-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<C-d>", "<C-d>zz", { desc = "Center line", noremap = true, silent = true })
map("n", "<C-u>", "<C-u>zz", { desc = "Center line", noremap = true, silent = true })
map("n", "<leader>k", '<cmd>lua require("kubectl").toggle()<cr>', { noremap = true, silent = true })

-- E5107: Error loading lua [string ":lua"]:1: function arguments expected near '}'
