vim.cmd("set hls")
vim.cmd("nohls")
vim.cmd("set ic")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

-- path for downloading the lazy vim repo and adding it to the runtimepath of the nvim.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- cloning the repo to the required path if not already cloned.
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

-- adding the lazy vim path to the run time path of vim to look for the script of lazy.nvim to load it while starting nvim. run time path is the path vim uses to look for plugins and scripts to load whenn starting.
vim.opt.rtp:prepend(lazypath)

-- all the packages will have a setup function in nvim. here we are loading the lazy package and setting it up with the plugins and options.
require("lazy").setup("plugins")








