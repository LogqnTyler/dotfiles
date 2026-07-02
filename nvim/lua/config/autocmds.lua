-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "quarto", "markdown" },
  callback = function()
    vim.keymap.set("i", "<C-l>", [[\left( \right)<Left><Left><Left><Left><Left><Left><Left>]], {
      buffer = true,
      desc = "Insert LaTeX parens",
    })
  end,
})

-- Compile and run current Java file
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    vim.keymap.set("n", "<leader>rj", function()
      local file = vim.fn.expand("%:p")
      local dir = vim.fn.expand("%:p:h")
      local class = vim.fn.expand("%:t:r")
      vim.cmd("write")
      vim.cmd(string.format("split | terminal cd %s && javac %s && java %s", dir, file, class))
    end, { buffer = true, desc = "Run current Java file" })
  end,
})
