require('nvim-treesitter.configs').setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "php", "bash", "comment", "css", "dockerfile", "gitattributes", "gitcommit", "gitignore", "graphql", "html", "http", "javascript", "json", "markdown", "passwd", "phpdoc", "regex", "scss", "sql", "twig", "typescript", "vue", "yaml"  },
    highlight = {
    enable = true,
    disable = { 'NvimTree' },
    additional_vim_regex_highlighting = true,
  },
  autotag = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["if"] = "@function.inner",
        ["af"] = "@function.outer",
        ["ic"] = "@class.inner",
        ["ac"] = "@class.outer",
        ['ia'] = '@parameter.inner',
        ['aa'] = '@parameter.outer',
      },
    },
  },
  context_commentstring = {
    enable = true,
  },
})
