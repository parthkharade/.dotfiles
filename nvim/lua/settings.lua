-- INTIALISATION
vim.cmd('set termguicolors')
vim.cmd('colorscheme doubletrouble')
vim.o.number = true
vim.o.cindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.cmd('set clipboard+=unnamedplus')
vim.g.clipboard = {
    name = 'win32yank-wsl',
    copy = {
        ['+'] = 'win32yank.exe -i --crlf',
        ['*'] = 'win32yank.exe -i --crlf',
    },
    paste = {
        ['+'] = 'win32yank.exe -o --lf',
        ['*'] = 'win32yank.exe -o --lf',
    },
}
vim.cmd('set mouse=')
