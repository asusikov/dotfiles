local configs = require'nvim-treesitter.configs'

configs.setup {
  ensure_installed = {
    "go",
    "ruby",
    "lua",
    "toml",
    "yaml",
    "json",
    "sql"
  }, -- Only use parsers that are maintained
  highlight = { -- enable highlighting
    enable = true, 
  },
  indent = {
    enable = false, -- default is disabled anyways
  }
}
