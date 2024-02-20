print("updated")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

-- path for downloading the lazy vim repo and adding it to the runtimepath of the nvim.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
print(lazypath);
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

local plugins = {
  -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
  { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts={}, },
-- init.lua:
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}
}

local opt = {}

-- all the packages will have a setup function in nvim. here we are loading the lazy package and setting it up with the plugins and options.
require("lazy").setup(plugins, opts)

local builtin = require("telescope.builtin")
 vim.keymap.set('n', '<C-p>', builtin.find_files, {})
 vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
-- require("catppuccin").setup()
-- vim.cmd.colorscheme "catppuccin"
vim.cmd.colorscheme "tokyonight-moon"



local configs = require("nvim-treesitter.configs")

configs.setup({
  ensure_installed = { "lua", "javascript" },
  highlight = { enable = true },
  indent = { enable = true },  
})
