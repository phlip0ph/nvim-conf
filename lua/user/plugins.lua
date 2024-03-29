local fn = vim.fn

--Automatically install pakcer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end


local nocode = function()
	return vim.fn.exists('g:vscode') == 0
end

local iscode = function()
	return vim.fn.exists('g:vscode') == 1
end

-- Have packer use a popup window
if nocode == 0 then
	packer.init {
		display = {
			open_fn = function()
				return require("packer.util").float { border = "rounded" }
			end,
		},
	}
end

-- User Plugins
return packer.startup(function(use)
	use "wbthomason/packer.nvim" -- Have packer manage itself
	if iscode then
		use "asvetliakov/vim-easymotion" --Easy jump keys
	end
	if nocode then
		use { "nvim-lua/popup.nvim" } -- An implementation of the Popup API from vim in Neovim
		use "nvim-lua/plenary.nvim" -- Useful lua functions used in lots of plugins
		use "lambdalisue/suda.vim" -- Useful lua functions used in lots of plugins
		use { "phaazon/hop.nvim",
			branch = 'v1',
			config = function()
				require 'hop'.setup { keys = 'asdghklqwertyuiopzxcvbnmfj' }
			end
		} -- Annotated document jumping and movement

		--Completion plugins
		use { "ms-jpq/coq_nvim", branch = 'coq' }
		use { "ms-jpq/coq.thirdparty", branch = "3p" }
		use { "ms-jpq/coq.artifacts", branch = "artifacts" }
		--[[ use "hrsh7th/nvim-cmp" -- Completion plugin ]]
		--[[ use "hrsh7th/cmp-buffer" -- Buffer completion ]]
		--[[ use "hrsh7th/cmp-path" -- Path completion ]]
		--[[ use "hrsh7th/cmp-cmdline" -- cmdline completion ]]
		--[[ use "hrsh7th/cmp-nvim-lsp" -- LSP completion ]]
		--[[ use "saadparwaiz1/cmp_luasnip" -- snippet completion ]]

		-- snippets
		use "L3MON4D3/LuaSnip" -- Snippet Engine
		--[[ use "rafamadriz/friendly-snippets" -- Snippet collection ]]

		-- vue
		use "leafOfTree/vim-vue-plugin" --Proper indentation plugin

		-- Commenting
		use {
			"numtoStr/Comment.nvim",
			config = function()
				require('Comment').setup()
			end
		} -- Easy commenting

		-- Treesitter
		use {
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		}
		use "JoosepAlviste/nvim-ts-context-commentstring" --Enable jsx and tsx commenting
		use "windwp/nvim-ts-autotag"

		--Colorschemes
		use "lunarvim/colorschemes" --Additional colorschemes
		use "sainnhe/sonokai" --Colorscheme
		use "sainnhe/everforest" --Colorscheme

		--Language Server Protocols
		use "neovim/nvim-lspconfig" -- Enables LSPs
		use { -- External editing tool installer (LSPs, Linters, etc.)
			"williamboman/mason.nvim",
			config = function() require("mason").setup() end
		}
		use "williamboman/mason-lspconfig.nvim" -- Bridges mason.nvim and lspconfig
		use "mfussenegger/nvim-lint" --Async linter for use with mason.nvim
		--use "williamboman/nvim-lsp-installer" -- Simple LSP installer [Unmaintained, do not use]

		-- Git
		use "lewis6991/gitsigns.nvim" -- Git navigation and management

		-- Telescope
		use "nvim-telescope/telescope.nvim" -- Various fuzzy finding functions including finding files and text in files
		use "nvim-telescope/telescope-media-files.nvim"

		-- Auto surround and pairing
		use "tpope/vim-surround" -- Surround shortcuts
		use "windwp/nvim-autopairs" -- Auto pairing

		-- Buffers
		use "akinsho/bufferline.nvim" --Bufferline
		use "moll/vim-bbye"

		-- Tree Explorer
		use { "kyazdani42/nvim-tree.lua", -- Tree Explorer
			requires = {
				use "kyazdani42/nvim-web-devicons", -- File icons
			},
			config = function() require 'nvim-tree'.setup {} end
		}

		-- Lualine
		use 'nvim-lualine/lualine.nvim' --Status line

		-- Toggle Term
		use "akinsho/toggleterm.nvim" --Toggleable Terminal

		-- Projects
		use {
			"ahmedkhalf/project.nvim", --Allows for project folders
			config = function()
				require("project_nvim").setup {}
			end
		}

		-- Indent blankline
		use "lukas-reineke/indent-blankline.nvim" -- Indentation indicators

		--Markdown Preview
		use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install",
			setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

		--Codeium AI Assistant
		use 'Exafunction/codeium.vim'
	end


	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
