local db = require('dashboard')

db.custom_header = {
    '',
    '       JJJJJJJJJJJJJJJ              KKKKKKK',
    '     JJJJJJJJJJJJJJJJJ           KKKKKK',
    '  JJJJJJJJJJJJJJJJJJJ         KKKKK',
    ' JJJJJ          JJJJJ       KKKKK',
    'JJJJ             JJJJ     KKKKK',
    '                 JJJJ    KKKKK',
    '                 JJJJ   KKKK',
    '                 JJJJ  KKKK',
    '                 JJJJKKKK',
    '                 JJJKKKK',
    '                 JJJKKKK',
    '                 JJJJKKKK',
    '                 JJJJ  KKKK',
    '                 JJJJ   KKKK',
    '                 JJJJ    KKKKK',
    'JJJJ             JJJJ     KKKKK',
    ' JJJJJ          JJJJJ       KKKKK',
    '  JJJJJJJJJJJJJJJJJJJ         KKKKK',
    '     JJJJJJJJJJJJJJJJJ           KKKKKK',
    '       JJJJJJJJJJJJJJJ              KKKKKKK',
    '',
}

db.custom_center = {
  { icon = '  ', desc = 'New file                       ', action = 'enew' },
  { icon = '  ', shortcut = 'SPC f', desc = 'Find file                 ', action = 'Telescope find_files' },
  { icon = '  ', shortcut = 'SPC h', desc = 'Recent files              ', action = 'Telescope oldfiles' },
  { icon = '  ', shortcut = 'SPC g', desc = 'Find Word                 ', action = 'Telescope live_grep' },
}

db.custom_footer = { '' }

vim.cmd([[
  augroup DashboardHighlights
    autocmd ColorScheme * highlight DashboardHeader guifg=#6272a4
    autocmd ColorScheme * highlight DashboardCenter guifg=#f8f8f2
    autocmd ColorScheme * highlight DashboardShortcut guifg=#bd93f9
    autocmd ColorScheme * highlight DashboardFooter guifg=#6272a4
  augroup end
]])
vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#6272a4' })
vim.api.nvim_set_hl(0, 'DashboardCenter', { fg = '#f8f8f2' })
vim.api.nvim_set_hl(0, 'DashboardShortcut', { fg = '#bd93f9' })
vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = '#6272a4' })
