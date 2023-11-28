conform = require("conform")

format_settings = {
	async = false,
	lsp_fallback = true,
	timeout_ms = 1000,
}

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		ruby = { "rubocop" },
		javascript = { { "prettierd", "prettier" } },
		go = { "goimports", "gofumpt" },
	},
	format_on_save = format_settings,
})

vim.keymap.set({ "n", "v" }, "mp", function()
	conform.format(format_settings)
end, { desc = "Format file or range (in visual mode)" })
