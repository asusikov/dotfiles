return {
	-- 'shaunsingh/nord.nvim',
	-- "catppuccin/nvim",
  "EdenEast/nightfox.nvim",
	priority = 1000,
	config = function()
		-- vim.g.nord_bold = 0
		--
    require('nightfox').setup({

    })

		vim.cmd([[colorscheme dawnfox]])
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
