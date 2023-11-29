return {
	-- 'shaunsingh/nord.nvim',
	"arcticicestudio/nord-vim",
	priority = 1000,
	config = function()
		vim.g.nord_bold = 0

		vim.cmd([[colorscheme nord]])
	end,
}
