-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local out = vim.fn.system({
        "git", "clone", "--filter=blob:none", "--branch=stable",
        "https://github.com/folke/lazy.nvim.git", lazypath,
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({ { "Failed to clone lazy.nvim:\n" .. out, "ErrorMsg" } }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.tabstop        = 8
vim.opt.shiftwidth     = 8
vim.opt.expandtab      = false
vim.opt.smartindent    = true
vim.opt.wrap           = false
vim.opt.undofile       = true
vim.opt.hlsearch       = false
vim.opt.incsearch      = true
vim.opt.termguicolors  = true
vim.opt.scrolloff      = 8
vim.opt.signcolumn     = "yes"
vim.opt.updatetime     = 250
vim.opt.colorcolumn    = "100"
vim.opt.mouse          = "a"

require("lazy").setup({
    -- auto-detect indentation style (tabs vs spaces, width) from the file
    { "tpope/vim-sleuth" },

    -- accurate per-language syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local ok, ts = pcall(require, "nvim-treesitter.configs")
            if not ok then return end
            ts.setup({
                ensure_installed = {
                    "lua", "vim", "bash", "python", "rust",
                    "toml", "json", "yaml", "markdown",
                },
                auto_install = true,
                highlight = { enable = true },
            })
        end,
    },
})
