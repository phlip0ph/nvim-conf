local opts = {noremap = true, silent = true}
local term_opts = {silent = true}

--Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Window and Buffer Navigation
keymap("n", "<leader>q", "<cmd>bd<cr>", opts) -- Close buffer
keymap("n", "<S-l>", "<cmd>bnext<cr>", opts) -- Next buffer
keymap("n", "<S-h>", "<cmd>bprevious<cr>", opts) -- Last buffer

--Open lex explorer
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

--Telescope
keymap("n", "<leader><leader>p", "<cmd>Telescope find_files<cr>", opts)

--Hop
	--Normal Mode
keymap("", "<leader><leader>w", "<cmd>HopWordAC<cr>", opts)
keymap("", "<leader><leader>b", "<cmd>HopWordBC<cr>", opts)
keymap("", "<leader><leader>j", "<cmd>HopLineAC<cr>", opts)
keymap("", "<leader><leader>k", "<cmd>HopLineBC<cr>", opts)
keymap("", "<leader><leader>?", "<cmd>HopPattern<cr>", opts)
keymap("", "f", "<cmd>HopChar1AC<cr>", opts)
keymap("", "F", "<cmd>HopChar1BC<cr>", opts)

--Tile Navigation
keymap("", "<leader>w", "<C-w>", opts)

