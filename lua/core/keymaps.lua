vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>sf", ":w<CR>", { desc = "Save file", silent = true })
keymap.set("n", "<leader>sa", ":wa<CR>", { desc = "Save all", silent = true })

keymap.set("n", "<leader>qp", ":q<CR>", { desc = "Close pane", silent = true })
keymap.set("n", "<leader>qa", ":qa<CR>", { desc = "Close all", silent = true })

keymap.set("n", "<leader>pv", ":vsplit<CR>", { desc = "Split panes vertical", silent = true })
keymap.set("n", "<leader>ph", ":split<CR>", { desc = "Split panes horizontal", silent = true })

keymap.set("n", "ht", ":noh<CR>", { desc = "Hide highlighting", silent = true })
