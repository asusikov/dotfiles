return {
  'Exafunction/codeium.vim',
  config = function ()
    vim.keymap.set("i", "<C-u>", function()
      return vim.fn["codeium#Accept"]()
    end, { expr = true })
    vim.keymap.set("i", "<C-j>", function()
      return vim.fn["codeium#CycleCompletions"](1)
    end, { expr = true })
    vim.keymap.set("i", "<C-k>", function()
      return vim.fn["codeium#CycleCompletions"](-1)
    end, { expr = true })
    vim.keymap.set("i", "<C-c>", function()
      return vim.fn["codeium#Clear"]()
    end, { expr = true })
    vim.keymap.set("i", "<C-e>", function()
      return vim.fn["codeium#Complete"]()
    end, { expr = true })
  end
}