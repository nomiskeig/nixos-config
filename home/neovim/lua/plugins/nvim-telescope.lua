return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	requires = { { "nvim-lua/plenary.nvim " } },
    opts = {
        defaults = {
            mappings = {
                i = {
                    ["<esc>"] = require("telescope.actions").close
                }
            }
        }
    }
}
