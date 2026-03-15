-- KEY BINDINGS
vim.keymap.set({'n','v','i'},'<C-q>',':lua toggle_line_numbers()<CR>')
vim.keymap.set({'n'},'<C-s>',':w<CR><Esc>')
vim.keymap.set({'n'}, '<leader>p',': lua require("nabla").popup({border = "rounded"})<CR>', {noremap = true, silent = true})

-- FUNCTIONS
function toggle_line_numbers()

  if vim.wo.relativenumber == false and vim.wo.number == false then
    vim.wo.relativenumber = false
    vim.wo.number = true
  elseif vim.wo.relativenumber == false and vim.wo.number == true then
    vim.wo.relativenumber = true
    vim.wo.number = false
  elseif vim.wo.relativenumber == true and vim.wo.number == false then
    vim.wo.relativenumber = false
    vim.wo.number = false
  end
end
