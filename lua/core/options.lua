local opts = {
	number = true,
	termguicolors = true,
	numberwidth = 1,
	signcolumn = "yes:1",
	cursorline = true,
	encoding = "UTF-8",
	shiftwidth = 2,
	tabstop = 2,
	expandtab = true,
	timeoutlen = 300,
	hidden = true,
	cmdheight = 0,
	autoread = true,
}

for k, v in pairs(opts) do
	vim.opt[k] = v
end

vim.opt.clipboard:append("unnamedplus")

local aug = vim.api.nvim_create_augroup("AutoReload", { clear = true })
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
	group = aug,
	command = "silent! checktime",
})
