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
set scrolloff=5

colorscheme jellybeans
" jellybean specific overrides
hi! LineNr ctermbg=235
hi! VertSplit ctermfg=236 ctermbg=236
hi! ColorColumn ctermbg=235

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
set mouse=a
set viminfo='1000,f1,<500,:1000,/1000
set history=500
set backspace=indent,eol,start

" Enable indentation matching for =>'s
filetype plugin indent on

" powerline plugin customizations
let g:Powerline_symbols = 'fancy'
call Pl#Theme#ReplaceSegment('lineinfo', 'linesinfo:lineinfo')
let g:Powerline_mode_n = 'N'
"call Pl#Theme#InsertSegment('filesize', 'after', 'fileinfo')

let g:tagbar_left = 1
let g:NERDTreeWinSize = 45

" key mappings
map <C-f> : TagbarToggle <CR>
map <C-g> : NERDTreeToggle <CR>
map <C-m> : MRU <CR>

nmap _Y :!echo ""> ~/.vi_tmp<CR><CR>:w! ~/.vi_tmp<CR>
vmap _Y :w! ~/.vi_tmp<CR>
nmap _P :r ~/.vi_tmp<CR>

" close vim if NERDTree is the only buffer left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

if &grepprg ==# 'grep -n $* /dev/null'
  set grepprg=grep\ -rnH\ --exclude='.*.swp'\ --exclude='*~'\ --exclude='*.log'\ --exclude=tags\ $*\ /dev/null
endif

" smarty syntax
au BufRead,BufNewFile *.tpl set filetype=smarty
