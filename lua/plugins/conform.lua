conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		ruby = { "rubocop" },
		javascript = { { "prettierd", "prettier" } },
		go = { "goimports", "gofumpt" },
	},
	format_on_save = {
		lsp_fallback = false,
		timeout_ms = 1000,
	},
})

vim.keymap.set({ "n", "v" }, "mp", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "Format file or range (in visual mode)" })
