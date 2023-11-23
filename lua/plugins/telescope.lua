local actions = require("telescope.actions")

require('telescope').setup({
  defaults = {
      mappings = {
          i = {
              ["<esc>"] = actions.close,
          },
          -- n = { ["q"] = require("telescope.actions").close },
      },
      prompt_prefix = "   ",
      selection_caret = "  ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.45,
          -- results_width = 1,
        },
      },
      path_display = { "truncate" },
      winblend = 0,
      border = {},
      borderchars = {
        prompt = { "─", "│", " ", "│", "┌", "┬", "│", "│" },
        results = { "─", "│", "─", "│", "├", "┤", "┴", "└" },
        preview = { "─", "│", "─", " ", "─", "┐", "┘", "─" },
      },
      -- width = 1.5,
      height = 0.80,
      preview_cutoff = 120,
  },
  pickers = {
    lsp_references = {
      show_line = false,
    },
    lsp_implementations = {
      show_line = false,
    },
    lsp_document_symbols = {
      symbol_width = 60,
    }
  },
  extensions = {
    file_browser = {
      grouped = true,
      initial_mode = "normal",
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
  require("telescope.builtin").lsp_definitions {
    jump_type = "never",
  }
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

km.set("n", "ff", function()
  require("telescope").extensions.file_browser.file_browser {
    path = "%:p:h",
    select_buffer = true, 
  }
end)

km.set("n", "ft", function()
  require("telescope").extensions.file_browser.file_browser()
end)

-- km.set('n', '<space>rn', vim.lsp.buf.rename)
-- nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
-- nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
-- nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
-- nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
-- vim.api.nvim_set_keymap('n', 'tf', "<cmd> lua require('telescope.builtin').live_grep()<cr>", {})

