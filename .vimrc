call pathogen#infect()

" turn off auto adding comments on next line for cut/paste operations
set fo=tcq
set nocompatible
set modeline

syntax on
set t_Co=256
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
set autoindent
set expandtab
set nowrap
set laststatus=2
set encoding=utf-8

"colorscheme habilight2
colorscheme jellybeans
set number
set guioptions=em
set showtabline=2
set wildmenu
set wildmode=list:longest,full

set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor

" colorize whitespace and tab indents, kind of annoying but interesting
""highlight LiteralTabs ctermbg=darkblue guibg=darkgreen
""match LiteralTabs /\s\  /
""highlight ExtraWhitespace ctermbg=darkblue guibg=darkgreen
""match ExtraWhitespace /\s\+$/

set ruler
"set mouse=nicr
set mouse=a
set viminfo='1000,f1,<500,:1000,/1000
set history=500
set backspace=indent,eol,start

" Enable indentation matching for =>'s
filetype plugin indent on
" hack to autoload autoclose
runtime! plugin/autoclose.vim

" key mappings
map <C-f> : TlistToggle <CR>
map <C-g> : NERDTreeToggle <CR>

nmap _Y :!echo ""> ~/.vi_tmp<CR><CR>:w! ~/.vi_tmp<CR>
vmap _Y :w! ~/.vi_tmp<CR>
nmap _P :r ~/.vi_tmp<CR>

let g:Powerline_symbols = 'fancy'
"call Pl#Theme#InsertSegment('linesinfo', 'after', 'lineinfo')
call Pl#Theme#ReplaceSegment('lineinfo', 'linesinfo:lineinfo')

" close vim if NERDTree is the only buffer left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>
