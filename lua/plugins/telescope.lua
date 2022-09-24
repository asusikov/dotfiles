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

km.set("n", "fg", function()
  require("telescope.builtin").live_grep()
end)

km.set("n", ";", function()
  require("telescope.builtin").buffers()
end)

-- nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
-- nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
-- nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
-- nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
-- vim.api.nvim_set_keymap('n', 'tf', "<cmd> lua require('telescope.builtin').live_grep()<cr>", {})

