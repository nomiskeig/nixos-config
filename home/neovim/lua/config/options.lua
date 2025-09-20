local options = {
	backup = false,
	clipboard = "unnamedplus",
	conceallevel = 0,
	fileencoding = "utf-8",
	hlsearch = true,
	ignorecase = true,
	showmode = false,
	showtabline = 2,
	smartcase = true,
	smartindent = true,
	splitright = true,
	termguicolors = true,
	swapfile = false,
	timeout = true,
	timeoutlen = 200,
    ttimeoutlen = 10,
	undofile = true,
	updatetime = 300,
	writebackup = false,
	expandtab = true,
	shiftwidth = 4,
	tabstop = 4,
	cursorline = true,
	number = true,
	relativenumber = false,
	numberwidth = 4,
	signcolumn = "yes",
	scrolloff = 8,
	sidescrolloff = 8,
	background = "dark",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
