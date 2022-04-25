return {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = '/usr/local/bin/luajit',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim', 'love', 'pretty'},
				disable = {
					"lowercase-global"
				}
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
					vim.fn.expand"$VIMRUNTIME/lua",
					'${3rd}/love2d/library'
				},
				checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
