return {
	"benmills/vimux",
	config = function()
		vim.g.VimuxHeight = "30"
		vim.keymap.set("n", "to", function()
			vim.cmd("VimuxOpenRunner")
		end)
		vim.keymap.set("n", "<leader>tq", function()
			vim.cmd("VimuxCloseRunner")
		end)
		vim.keymap.set("n", "tb", function()
			vim.cmd("VimuxRunCommand('clear; dip bash')")
		end)
	end,
}
