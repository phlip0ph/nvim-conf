local opts = {noremap = true, silent = true}
local term_opts = {silent = true}

--Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Comments
keymap("n", "gc", ":VSCodeCommentary<cr>", opts)
keymap("v", "gc", ":VSCodeCommentary<cr>", opts)
keymap("o", "gc", ":VSCodeCommentary<cr>", opts)

--Tab Navigation
keymap("n", "<leader>q", ":tabclose<cr>", term_opts) -- Close tab
keymap("n", "<S-l>", ":tabn<Enter>", term_opts) -- Next tab
keymap("n", "<S-h>", ":tabp<cr>", term_opts) -- Last tab
