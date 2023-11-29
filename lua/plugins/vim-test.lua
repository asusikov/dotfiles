return {
	"vim-test/vim-test",
	config = function()
		vim.g["test#strategy"] = "vimux"
		vim.g["test#ruby#rspec#options"] = "--format documentation"
		vim.g["test#go#gotest#options"] = "-count=1 -v"

		vim.keymap.set("n", "tr", function()
			vim.cmd("TestNearest")
		end)
		vim.keymap.set("n", "ta", function()
			vim.cmd("TestFile")
		end)
		vim.keymap.set("n", "te", function()
			vim.cmd("TestLast")
		end)
	end,
}
