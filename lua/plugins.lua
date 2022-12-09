local ensure_packer = function()
    local fn = vim.fn
        local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
        if fn.empty(fn.glob(install_path)) > 0 then
            fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
            vim.cmd [[packadd packer.nvim]]
            return true
        end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function() 
        require 'nvim-treesitter.configs'.setup { highlight = { enable = true }}
    end}

    use {'neovim/nvim-lspconfig'}
    -- Visualize lsp progress
    use({ "j-hui/fidget.nvim",
        config = function()
        require("fidget").setup()
        end
    })

    -- Autocompletion framework
    use("hrsh7th/nvim-cmp")
    use({
        -- cmp LSP completion
        "hrsh7th/cmp-nvim-lsp",
        -- cmp Snippet completion
        "hrsh7th/cmp-vsnip",
        -- cmp Path completion
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        after = { "hrsh7th/nvim-cmp" },
        requires = { "hrsh7th/nvim-cmp" },
    })
    -- See hrsh7th other plugins for more great completion sources!
    -- Snippet engine
    use('hrsh7th/vim-vsnip')
    -- Adds extra functionality over rust analyzer
    use("simrat39/rust-tools.nvim")

    -- Optional
    use("nvim-lua/popup.nvim")
    use("nvim-lua/plenary.nvim")
    use({"nvim-telescope/telescope.nvim", requires = {'nvim-lua/plenary.nvim'}})

    use("ms-jpq/chadtree")
    use("voldikss/vim-floaterm")

    use {'lewis6991/gitsigns.nvim', config = function()
        require('gitsigns').setup()
    end }

    use {"windwp/nvim-autopairs", config = function()
        require('nvim-autopairs').setup {}
    end }

    use { 'numToStr/Comment.nvim', config = function()
        require('Comment').setup()
    end }

    use { 'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup()
        end
    }

    use 'mfussenegger/nvim-dap' 
    use 'ThePrimeagen/vim-be-good'

    -- Some color scheme other then default
    use("EdenEast/nightfox.nvim")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
