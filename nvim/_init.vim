"-----
"----- Inits 
"-----

"syntax enable
"colorscheme desert

let mapleader = ',' 						" The default leader is backslash, but a comma is much better
set number 							" Let's activate line numbers
set backspace=indent,eol,start					" Make backspace behave like every other editor


"-----
"----- Mappings 
"-----

"Make it easy to edit the config file 
nmap <leader>ev :tabedit $MYVIMRC<cr>
"Add simple highlight removal
nmap <leader><space> :nohlsearch<cr>


"-----
"----- Auto-Commands
"-----

"Automatically source the config file on save
augroup autosourcing
	autocmd!
	autocmd BufWritePost $MYVIMRC source %
augroup END


"-----
"----- Search
"-----

set hlsearch
set incsearch
