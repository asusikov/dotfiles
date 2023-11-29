return {
    -- 'shaunsingh/nord.nvim',
  'arcticicestudio/nord-vim',
    priority = 1000, 
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme nord]])
    end,
}
