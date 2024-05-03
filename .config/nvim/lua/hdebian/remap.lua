vim.g.mapleader = " " -- space bar as the leader
vim.keymap.set("n", "<leader>v", vim.cmd.Ex) -- explorer

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move line down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move line up

vim.keymap.set("n", "J", "mzJ`z") -- delete the next newline
vim.keymap.set("n", "<C-j>", "<C-d>zz") -- pg down
vim.keymap.set("n", "<C-k>", "<C-u>zz") -- pg up
vim.keymap.set("v", "<C-j>", "<C-d>zz") -- pg down
vim.keymap.set("v", "<C-k>", "<C-u>zz") -- pg up
vim.keymap.set("v", "<C-a>", "40h") -- pg down
vim.keymap.set("v", "<C-h>", "40l") -- pg up
vim.keymap.set("n", "<C-a>", "40h") -- pg down
vim.keymap.set("n", "<C-h>", "40l") -- pg up
vim.keymap.set("n", "n", "nzzzv") -- next occurence - while centering
vim.keymap.set("n", "N", "Nzzzv") -- prev occurence - while centering

vim.keymap.set("x", "<leader>p", "\"_dP") -- paste over but do not append 
                                          -- the removed section to the buffer

vim.keymap.set("n", "<leader>y", "\"+y") -- clipboard
vim.keymap.set("v", "<leader>y", "\"+y") -- clipboard
vim.keymap.set("n", "<leader>Y", "\"+Y") -- clipboard

vim.keymap.set("v", ">", ">gv") -- Keep selection after indentation
vim.keymap.set("v", "<", "<gv") -- Keep selection after indentation

vim.keymap.set("n", "*", "*''") -- Mark word as search phrase
