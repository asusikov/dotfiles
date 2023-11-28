return {
    'shaunsingh/nord.nvim',
    priority = 1000, 
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme nord]])
    end,
}
