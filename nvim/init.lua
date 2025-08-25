require("core")
require("lazyman")
vim.cmd([[ autocmd BufEnter * silent! lcd %:p:h]])
