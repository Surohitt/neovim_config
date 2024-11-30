vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pv", ':Neotree filesystem reveal left<CR>')

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<leader>hor", vim.cmd.split)
vim.keymap.set("n", "<leader>v", vim.cmd.vsplit)

vim.keymap.set("n", "<leader>t", vim.cmd.term)
vim.keymap.set("t", "<C-e>", [[<C-\><C-n>]])


vim.keymap.set("n", "<C-E>", function()
    vim.cmd.vsplit()
    vim.cmd.Ex()
    vim.cmd('vertical resize -40')
end);

vim.keymap.set("n", "<leader>resize", function()
    vim.cmd('vertical resize 80')
end);

vim.api.nvim_create_user_command(
  'Hresize',
  function(opts)
    vim.api.nvim_command('vertical resize ' .. opts.args)
  end,
  { nargs = 1 }
)


vim.api.nvim_create_user_command(
  'Vresize',
  function(opts)
    vim.api.nvim_command('horizontal resize ' .. opts.args)
  end,
  { nargs = 1 }
)
vim.keymap.set("n", "rn", vim.lsp.buf.rename)

