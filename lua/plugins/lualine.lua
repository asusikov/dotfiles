local custom_nord = require'lualine.themes.nord'

custom_nord.normal.c = function() 
  return { bg = vim.bo.modified and '#4C566A' or '#3B4252' }
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = custom_nord,
    component_separators = '',
    section_separators = '',
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'diagnostics'},
    lualine_c = {
          'filename',
    },
    lualine_x = {'fileformat', 'filetype'},
    lualine_y = {},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
