local fterm = require("FTerm")

local lazygit = fterm:new({
    ft = 'fterm_lazygit', -- You can also override the default filetype, if you want
    cmd = "lazygit",
    dimensions = {
        height = 0.9,
        width = 0.9
    }
})

-- Use this to toggle gitui in a floating terminal
vim.keymap.set('n', 'lg', function()
    lazygit:toggle()
end)
