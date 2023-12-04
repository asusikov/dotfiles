return {
	-- 'shaunsingh/nord.nvim',
	"arcticicestudio/nord-vim",
	priority = 1000,
	config = function()
		vim.g.nord_bold = 0

		vim.cmd([[colorscheme nord]])

		vim.cmd([[hi Statement gui=NONE]])
		vim.cmd([[hi RubyConstant guifg=#ECEFF4]])
		vim.cmd([[hi RubyConstant guifg=#ECEFF4]])
		vim.cmd([[hi RubyConstant guifg=#ECEFF4]])
		vim.cmd([[hi RubyConstant guifg=#ECEFF4]])
		vim.cmd([[hi String guifg=#88C0D0]])
		vim.cmd([[hi Number guifg=#88C0D0]])
	end,
}
