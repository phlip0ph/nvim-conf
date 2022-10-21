--Import user config files
if vim.g.vscode == nil then
	require "user.plugins"
	require "user.colorscheme"
	require "user.options"
	require "user.keymaps"
	require "user.coq"
--	require "user.lsp"
	require "user.gitsigns"
	require "user.comment"
	require "user.telescope"
	require "user.treesitter"
	require "user.autopairs"
	require "user.bufferline"
	require "user.nvim-tree"
	require "user.toggleterm"
	require "user.lualine"
	require "user.projects"
	require "user.indent"
else
	require "user.plugins"
	require "vscode.options"
	require "vscode.keymaps"
end
