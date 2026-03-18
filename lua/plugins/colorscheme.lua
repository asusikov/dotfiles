return {
	-- 'shaunsingh/nord.nvim',
	-- "catppuccin/nvim",
-- c  "EdenEast/nightfox.nvim",
'vpoltora/cursor-light.nvim',
	priority = 1000,
	config = function()
		-- vim.g.nord_bold = 0
		--
    -- require('nightfox').setup({
    --
    -- })
require('cursor-light').setup()
    vim.cmd.colorscheme('cursor-light')
		-- vim.cmd([[colorscheme dawnfox]])
		--
		-- vim.cmd([[hi Statement gui=NONE]])
		-- vim.cmd([[hi RubyConstant guifg=#ECEFF4]])
		-- vim.cmd([[hi RubyConstant guifg=#ECEFF4]])
		-- vim.cmd([[hi RubyConstant guifg=#ECEFF4]])
		-- vim.cmd([[hi RubyConstant guifg=#ECEFF4]])
		-- vim.cmd([[hi String guifg=#88C0D0]])
		-- vim.cmd([[hi Number guifg=#88C0D0]])
	end,
}
