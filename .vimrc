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

"colorscheme habilight2
colorscheme jellybeans
set number
set guioptions=em
set showtabline=2
set wildmenu
set wildmode=list:longest,full

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

" close vim if NERDTree is the only buffer left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
