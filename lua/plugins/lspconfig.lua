return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lspconfig = require("lspconfig")
		local builtin = require("telescope.builtin")
		local keymap = vim.keymap

		local opts = { noremap = true, silent = true }

		local on_attach = function(client, bufnr)
			opts.desc = "Show LSP references"
			keymap.set("n", "lu", function()
				builtin.lsp_references()
			end, opts)

			opts.desc = "Go to declaration"
			keymap.set("n", "ld", function()
				builtin.lsp_definitions()
			end, opts)

			opts.desc = "Show LSP implementations"
			keymap.set("n", "li", function()
				builtin.lsp_implementations()
			end, opts)

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "lt", function()
				builtin.lsp_type_definitions()
			end, opts)

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "la", vim.lsp.buf.code_action, opts)

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "D", function()
				builtin.diagnostics({ bufnr = 0 })
			end, opts)

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts)

			opts.desc = "Show document symbols"
			keymap.set("n", "lo", function()
				require("telescope.builtin").lsp_document_symbols()
			end)
		end

		lspconfig["lua_ls"].setup({
			on_attach = on_attach,
		})

		lspconfig["gopls"].setup({
			on_attach = on_attach,
		})

		lspconfig["solargraph"].setup({
			on_attach = on_attach,
		})
	end,
}
