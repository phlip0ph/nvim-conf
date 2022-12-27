local status_ok, vvue = pcall(require, "vim-vue-plugin")
if not status_ok then
  return
end

vim.g.vim_vue_plugin_config = { 
	syntax = {
		template = { 'html' },
		script = { 'javascript' },
		style = { 'css' },
	},
	full_syntax = {},
	initial_indent = {},
	attribute = 0,
	keyword = 0,
	foldexpr = 0,
	debug = 0
}
