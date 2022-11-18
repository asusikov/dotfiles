local actions = require("telescope.actions")

require('telescope').setup({
  defaults = {
      mappings = {
          i = {
              ["<esc>"] = actions.close,
          },
      },
  },
})

local km = vim.keymap

km.set("n", ";g", function()
  require("telescope.builtin").live_grep()
end)

km.set("n", ";f", function()
  require("telescope.builtin").find_files()
end)

km.set("n", ";b", function()
  require("telescope.builtin").buffers()
end)

km.set("n", "lu", function()
  require("telescope.builtin").lsp_references()
end)

km.set("n", "ld", function()
  require("telescope.builtin").lsp_definitions()
end)

km.set("n", "lp", function()
  require("telescope.builtin").lsp_definitions() 
    -- -- previewer = true,
    -- layout_strategy = "horizontal", 
    -- grep_open_files = false,
    -- jump_type = "never", 
  -- }
end)

km.set("n", "lo", function()
  require("telescope.builtin").lsp_document_symbols()
end)

km.set("n", "li", function()
  require("telescope.builtin").lsp_implementations()
end)

km.set("n", "lc", function()
    require("telescope.builtin").lsp_incoming_calls()
end)

-- km.set('n', '<space>rn', vim.lsp.buf.rename)
-- nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
-- nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
-- nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
-- nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
-- vim.api.nvim_set_keymap('n', 'tf', "<cmd> lua require('telescope.builtin').live_grep()<cr>", {})

