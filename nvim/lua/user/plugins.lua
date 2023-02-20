local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require('packer').reset()
require('packer').init({
    compile_path = vim.fn.stdpath('data') .. '/site/plugin/packer_compiled.lua',
    display = {
        open_fn = function()
            return require('packer.util').float({
                border = 'solid'
            })
        end
    }
})

local use = require('packer').use

-- Packer can manage itself
use('wbthomason/packer.nvim')

-- One Dark theme
use({
    'navarasu/onedark.nvim',
    config = function()
        vim.cmd('colorscheme onedark')
        vim.cmd('highlight SpellBad guifg=NONE')

        -- -- Hide the characters in FloatBorder
        -- vim.api.nvim_set_hl(0, 'FloatBorder', {
        --   fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
        --   bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
        -- })

        -- -- Make the StatusLineNonText background the same as StatusLine
        vim.api.nvim_set_hl(0, 'StatusLineNonText', {
            fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
            bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background
        })

        -- -- Hide the characters in CursorLineBg
        -- vim.api.nvim_set_hl(0, 'CursorLineBg', {
        --   fg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
        --   bg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
        -- })

        -- vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = '#30323E' })
        vim.api.nvim_set_hl(0, 'IndentBlanklineChar', {
            fg = '#2F313C'
        })

    end
})

-- Automatically add closing brackets, quotes, etc.
use({
    'windwp/nvim-autopairs',
    config = function()
        require('nvim-autopairs').setup()
    end
})

-- Commenting support
use('tpope/vim-commentary')

-- Add, change and delete surrounding text
use('tpope/vim-surround')

-- Useful commands like ":Rename" and ":SudoWrite"
use('tpope/vim-eunuch')

-- Indent autodetection with editorconfig support
use('tpope/vim-sleuth')

-- Allow plugins to enable repeating of commands
use('tpope/vim-repeat')

-- Add more languages
use('sheerun/vim-polyglot')

-- Jump to the last location when opening a file
use('farmergreg/vim-lastplace')

-- Enable * searching with visually selected text
use('nelstrom/vim-visual-star-search')

-- Automatically create parent dirs when saving
use('jessarcher/vim-heritage')

-- Text objects for HTML attributes
use({
    'whatyouhide/vim-textobj-xmlattr',
    requires = 'kana/vim-textobj-user'
})

-- Automatically set the working directory to the project root
use({
    'airblade/vim-rooter',
    setup = function()
        -- Instead of this running every time we open a file, we'll just run it once when Vim starts
        vim.g.rooter_manual_only = 1
    end,
    config = function()
        vim.cmd('Rooter')
    end
})

-- Add smooth scrolling to avoid jarring jumps
use({
    'karb94/neoscroll.nvim',
    config = function()
        require('neoscroll').setup()
    end
})

-- Split arrays and methods onto multiple lines, or join them back up
use({
    'AndrewRadev/splitjoin.vim',
    config = function()
        vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
        vim.g.splitjoin_trailing_comma = 1
        vim.g.splitjoin_php_method_chain_full = 1
    end
})

-- Automatically fix identation when pasting code
use('sickill/vim-pasta')

-- File tree sidebar
use({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
        require('user.plugins.nvim-tree')
    end
})

-- Fuzzy finder
use({
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/plenary.nvim'}, {'kyazdani42/nvim-web-devicons'}, {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }, {'nvim-telescope/telescope-live-grep-args.nvim'}},
    config = function()
        require('user.plugins.telescope')
    end
})

-- A Status line
use({
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
        require('user.plugins.lualine')
    end
})

-- Displays buffers as tabs
use({
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    after = 'onedark.nvim',
    config = function()
        require('user.plugins.bufferline')
    end
})

-- Display identation line
use({
    'lukas-reineke/indent-blankline.nvim',
    config = function()
        require('user.plugins.indent-blankline')
    end
})

-- Add a dashboard
use({
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('user.plugins.dashboard')
    end,
    requires = {'nvim-tree/nvim-web-devicons'}
})

-- Git integration
use({
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
        require('gitsigns').setup()
        vim.keymap.set('n', ']h', ':Gitsigns next_hunk<CR>')
        vim.keymap.set('n', '[h', ':Gitsigns prev_hunk<CR>')
        vim.keymap.set('n', 'gs', ':Gitsigns stage_hunk<CR>')
        vim.keymap.set('n', 'gS', ':Gitsigns undo_stage_hunk<CR>')
        vim.keymap.set('n', 'gp', ':Gitsigns preview_hunk<CR>')
        vim.keymap.set('n', 'gb', ':Gitsigns blame_line<CR>')
    end
})

use({
    'tpope/vim-fugitive',
    requires = 'tpope/vim-rhubarb'
})

use({
    'voldikss/vim-floaterm',
    config = function()
        require('user.plugins.floaterm')
    end
})

-- autocomplete tags
use({
    'windwp/nvim-ts-autotag',
})

-- Improved syntax highlighting and other things
use({
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({
            with_sync = true
        })
        ts_update()
    end,
    requires = {'nvim-treesitter/playground', 'nvim-treesitter/nvim-treesitter-textobjects',
                'JoosepAlviste/nvim-ts-context-commentstring'},
    config = function()
        require('user.plugins.treesitter')
    end
})

-- Language Server Protocol
use({
    'neovim/nvim-lspconfig',
    requires = {'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', 'jose-elias-alvarez/null-ls.nvim',
                'jayp0521/mason-null-ls.nvim'},
    config = function()
        require('user.plugins.lspconfig')
    end
})

-- Completion
use({
    'hrsh7th/nvim-cmp',
    requires = {'L3MON4D3/LuaSnip', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-nvim-lsp-signature-help',
                'hrsh7th/cmp-nvim-lua', 'jessarcher/cmp-path', 'onsails/lspkind-nvim', 'saadparwaiz1/cmp_luasnip'},
    config = function()
        require('user.plugins.cmp')
    end
})

-- PHP Refactoring Tools
use({
    'phpactor/phpactor',
    ft = 'php',
    run = 'composer install --no-dev --optimize-autoloader',
    config = function()
        vim.keymap.set('n', '<leader>pm', ':PhpactorContextMenu<CR>')
    end
})

-- Testing helper
use({
    'vim-test/vim-test',
    config = function()
        require('user.plugins.vim-test')
    end
})

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
    require('packer').sync()
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])
