local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>w", function()
	vim.cmd("w")
end, { noremap = true })

vim.api.nvim_set_keymap("i", "jk", "<ESC>", opts)

vim.keymap.set("n", "<S-l>", function()
	vim.cmd.bnext()
end, opts)
vim.keymap.set("n", "<S-h>", function()
	vim.cmd.bprevious()
end, opts)

vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)

vim.keymap.set("n", "<leader>e", require("nvim-tree.api").tree.toggle, opts)

-- LSP
vim.keymap.set("n", "<leader>lf", function()
	require("conform").format()
end, { noremap = true })
vim.keymap.set("n", "<leader>la", function()
	vim.lsp.buf.code_action()
end, opts)
vim.keymap.set("n", "<leader>lr", function()
	vim.lsp.buf.rename()
end, opts)
vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover({ title = "Info", border = "rounded" })
end, opts)
vim.keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end, opts)
vim.keymap.set("n", "gr", function()
	vim.lsp.buf.references()
end, opts)
vim.keymap.set("n", "gd", function()
	vim.lsp.buf.definition()
end, opts)
vim.keymap.set("n", "gD", function()
	vim.lsp.buf.declaration()
end, opts)
vim.keymap.set("n", "gi", function()
	vim.lsp.buf.implementation()
end, opts)
vim.keymap.set("n", "gs", function()
	vim.lsp.buf.signature_help()
end, opts)

-- Telescope

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>F", function()
	builtin.find_files(require("telescope.themes").get_dropdown{ previewer = false })
end, opts)
vim.keymap.set("n", "<leader>f", "<cmd>Telescope live_grep theme=ivy<cr>", opts)
