o = vim.opt

local options = {
	number = true,
	relativenumber = true,
	cursorline = true,
	clipboard = "unnamedplus",
	cmdheight = 3,
	termguicolors = true,
	tabstop = 2,
	shiftwidth = 2,
	softtabstop = 2
}

for k,v in pairs(options) do
	o[k] = v
end

