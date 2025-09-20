return {
	"saghen/blink.cmp",
	dependencies = {
		{ "nvim-mini/mini.nvim", version = false },
	},
	version = "1.*",
	opts = {
		keymap = {
			preset = "default",
			["<C-j>"] = { "select_next", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-space>"] = {
				function(cmp)
					cmp.show({ providers = { "lsp" } })
				end,
			},
		},
		signature = { enabled = true },
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			list = {
				selection = {
					preselect = false,
					auto_insert = true,
				},
			},
			documentation = { auto_show = false },
			menu = {
				draw = {

					--padding = { 0, 1 },
					--columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "source_name" } },
					--components = {
					--	kind_icon = {
							--ellipsis = false,
                            --
							--text = function(ctx)
							--	local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
							--	return kind_icon
							--end,
							--highlight = function(ctx)
							--	local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
							--	return hl
							--end,
						--},
						--kind = {
						--	ellipsis = false,
                            --
						--	text = function(ctx)
						--		return ctx.kind
						--	end,
						--	highlight = function(ctx)
							--	local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                                ---
							--	return hl
							--end,
						--},
					--},
				},
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
