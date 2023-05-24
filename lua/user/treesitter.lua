local configs = require("nvim-treesitter.configs")
configs.setup {
	ensure_installed = "all",
	sync_install = false,
	autotag = { enable = true },
	context_commentstring = { enable = true },
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,

	},
	indent = { enable = false, disable = { "yaml" } },
}
