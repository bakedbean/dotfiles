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
set splitbelow
set splitright

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
set lazyredraw
set showmatch
set mat=2
" turn off backups
set nobackup
set nowb
set noswapfile
set foldmethod=syntax
set foldlevelstart=20
set hlsearch

hi Search ctermbg=DarkGray
hi Search ctermfg=White

let javaScript_fold=1

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
noremap <leader>i <Esc>:TagbarToggle<CR>
noremap <leader>o <Esc>:NERDTreeToggle<CR>
noremap <leader>p <Esc>:YRShow<CR>
noremap <leader>[ <Esc>:CommandT<CR>
inoremap jk <esc>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
inoremap <silent> <Esc> <C-O>:stopinsert<CR>
" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" close vim if NERDTree is the only buffer left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

autocmd Syntax c,cpp,vim,xml,html,xhtml,js,rb setlocal foldmethod=syntax
autocmd Syntax c,cpp,vim,xml,html,xhtml,perl,js,rb normal zR

if &grepprg ==# 'grep -n $* /dev/null'
  set grepprg=grep\ -rnH\ --exclude='.*.swp'\ --exclude='*~'\ --exclude='*.log'\ --exclude=tags\ $*\ /dev/null
endif

" smarty syntax
au BufRead,BufNewFile *.tpl set filetype=smarty

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" tabline customizations
hi TabLineSel ctermfg=DarkBlue ctermbg=White
hi TabLine ctermfg=White ctermbg=DarkBlue

set tabline=%!MyTabLine()  " custom tab pages line
function MyTabLine()
  let s = '' " complete tabline goes here
  " loop through each tab page
  for t in range(tabpagenr('$'))
    " set highlight
    if t + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    " set the tab page number (for mouse clicks)
    let s .= '%' . (t + 1) . 'T'
    let s .= ' '
    " set page number string
    let s .= t + 1 . ' '
    " get buffer names and statuses
    let n = ''      "temp string for buffer names while we loop and check buftype
    let m = 0       " &modified counter
    let bc = len(tabpagebuflist(t + 1))     "counter to avoid last ' '
    " loop through each buffer in a tab
    for b in tabpagebuflist(t + 1)
      " buffer types: quickfix gets a [Q], help gets [H]{base fname}
      " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
      if getbufvar( b, "&buftype" ) == 'help'
        let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
      elseif getbufvar( b, "&buftype" ) == 'quickfix'
        let n .= '[Q]'
      else
        let n .= pathshorten(bufname(b))
      endif
      " check and ++ tab's &modified count
      if getbufvar( b, "&modified" )
        let m += 1
      endif
      " no final ' ' added...formatting looks better done later
      if bc > 1
        let n .= ' '
      endif
      let bc -= 1
    endfor
    " add modified label [n+] where n pages in tab are modified
    if m > 0
      let s .= '[' . m . '+]'
    endif
    " select the highlighting for the buffer names
    " my default highlighting only underlines the active tab
    " buffer names.
    if t + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    " add buffer names
    if n == ''
      let s.= '[New]'
    else
      let s .= n
    endif
    " switch to no underlining and add final space to buffer list
    let s .= ' '
  endfor
  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'
  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLineFill#%999Xclose'
  endif
  return s
endfunction
