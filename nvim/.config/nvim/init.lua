vim.g.mapleader = " "
-- Lazy setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
vim.lsp.set_log_level("debug")

local opts = {
  rtp = {
    disabled_plugins = {
      "netrw",
      "netrwPlugin",
    },
  },
  change_detection = {
    notify = false,
  },
}

-- You will need to install language servers `npm i -g vscode-langservers-extracted` and `npm install -g typescript typescript-language-server`
require("lazy").setup({
  spec = "lazySetup",
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  ui = {
    border = "single",
  },
})
require("options")
require("setup.spelling")
require("mappings")
