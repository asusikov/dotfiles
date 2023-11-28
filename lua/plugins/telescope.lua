return {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
      dependencies = { 
	      'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
      },
      config = function()
	      local builtin = require('telescope.builtin')
	      local actions = require('telescope.actions')

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
            },
            find_files = {
              hidden = true,
            }
          },
          extensions = {
            file_browser = {
              grouped = true,
              initial_mode = "normal",
              hidden = { file_browser = true, folder_browser = true },
            },
          },
	      })

	      local keymap = vim.keymap

        local file_browser = require("telescope").extensions.file_browser
        local select_buffer_opts = {
          path = "%:p:h",
          select_buffer = true, 
        }


	      keymap.set("n", ";f", function() builtin.find_files() end)
	      keymap.set("n", ";b", function() builtin.buffers() end)
	      keymap.set("n", ";g", function() builtin.live_grep() end)
	      keymap.set("n", "ff", function() file_browser.file_browser(select_buffer_opts) end)
	      keymap.set("n", "ft", function() file_browser.file_browser() end)
      end,
}
