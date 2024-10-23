vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim.undodir"
vim.opt.undofile = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.cmd.highlight({ "CursorLineNr", "guifg=#db4740", "gui=bold"})
vim.cmd.highlight({ "LineNr", "guifg=#80aa9e" })
