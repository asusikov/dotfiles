linter = require('lint') 

linter.linters_by_ft = {
  ruby = { 'rubocop' },
  go = { 'golangcilint' }
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  callback = function()
    linter.try_lint()
  end,
})
