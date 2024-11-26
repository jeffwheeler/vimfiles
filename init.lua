-- Setup Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Manage plugins
require("lazy").setup({
  -- Also a nice theme!
  -- { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "navarasu/onedark.nvim", priority = 999 },
  { "EdenEast/nightfox.nvim", priority = 998 },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup {
        renderer = {
          icons = {
            glyphs = {
              folder = {
                arrow_closed = "►",
                arrow_open = "▼",
              },
            },
            show = {
              file = false,
              folder = false,
              folder_arrow = true,
              git = false,
              modified = false,
              diagnostics = false,
              bookmarks = false,
            }
          }
        }
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require "nvim-treesitter.configs".setup {
        ensure_installed = { "glsl" },
        highlight = { enable = true },
      }
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "lspconfig".clangd.setup {}
      -- require "lspconfig".sourcekit.setup {}
      require "lspconfig".zls.setup{}
      require "lspconfig".glsl_analyzer.setup{}
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  }
})

-- Keybindings
local nvim_tree_api = require("nvim-tree.api")
vim.keymap.set("n", "<leader>e", nvim_tree_api.tree.toggle, {})
vim.keymap.set("n", "<leader>ff", nvim_tree_api.tree.find_file, {})

local telescope_builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>g", telescope_builtin.live_grep, {})
vim.keymap.set("n", "<leader>b", telescope_builtin.buffers, {})

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>cg", vim.lsp.buf.definition, {}) -- 'g' for go
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, {})
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {})

-- Make `Esc` exit Telescope
-- https://www.reddit.com/r/neovim/comments/pzxw8h/comment/hf40gol/
local actions = require("telescope.actions")
require("telescope").setup{
    defaults = { mappings = { i = { ["<esc>"] = actions.close } } }
}

-- Visual
vim.cmd.colorscheme("terafox")

vim.opt.cursorline = true
vim.opt.number = true

vim.opt.list = true
vim.opt.listchars = {
  tab = "➜ ",
  trail = "✖"
}

-- General editing behavior
vim.opt.scrolloff = 5

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
