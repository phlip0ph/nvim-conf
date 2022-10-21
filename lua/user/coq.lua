
vim.g.coq_settings = {
    auto_start = 'shut-up',
    clients = {
        lsp = {
          enabled = true,
        },
        tree_sitter = {
          enabled = true,
          weight_adjust = 1.0
        },
        tabnine = {
          enabled = true,
        },
        snippets = {
          user_path = '/home/phillipm/.config/nvim/lua/coq-user-snippets',
          weight_adjust = 1.4
        },
				display = {
					ghost_text = {
						enabled = true
					}
				}
    },
}

local coq_status_ok, coq= pcall(require, "coq")
if not coq_status_ok then
  return
end
