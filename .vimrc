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

set number
set guioptions=em
set showtabline=2
set wildmenu
set wildmode=list:longest,full
set splitbelow
set splitright

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
set hlsearch
set pastetoggle=<F2>

set rtp+=~/.fzf

"if has('folding')
  "if has('windows')
    "let &fillchars='vert: '           " less cluttered vertical window separators
  "endif
  "set foldmethod=indent               " not as cool as syntax, but faster
  "set foldlevelstart=99               " start unfolded
"endif

colorscheme jellybeans
" jellybean specific overrides
hi! LineNr ctermbg=235
hi! VertSplit ctermfg=236 ctermbg=236
hi! ColorColumn ctermbg=235

hi Search ctermbg=DarkGray
hi Search ctermfg=White

" Enable indentation matching for =>'s
filetype plugin indent on

" key mappings
noremap <leader>p <Esc>:TagbarToggle<CR>
"noremap <leader>o <Esc>:NERDTreeToggle<CR>
noremap <leader>o <Esc>:NERDTreeTabsToggle<CR>
nmap ,n :NERDTreeTabsFind<CR>
noremap <leader>i <Esc>:YRShow<CR>
noremap <leader>[ <Esc>:FZF<CR>
noremap <leader>] <Esc>:MRU<CR>
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
nnoremap <silent> <C-S> :<C-u>w<CR>
imap <C-l> <C-o>l
imap <C-h> <C-o>h

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap ss <Plug>(easymotion-s2)
nmap sk <Plug>(easymotion-w)
nmap sj <Plug>(easymotion-b)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map Q <Nop>

" vim-expand-region mappings
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

let g:EasyMotion_startofline = 0
let g:used_javascript_libs = 'angularjs,lo-dash,jquery,jasmine'
" allow command-t to browse more files
let g:CommandTMaxFiles=50000

let NERDTreeShowBookmarks=1
let NERDTreeMapOpenVSplit='sd'
let g:nerdtree_tabs_autofind=1
let g:nerdtree_tabs_open_on_console_startup=1
let g:NERDTreeWinSize = 45

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#tab_nr_type = 2
"let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#show_buffers = 1

 let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ }

" powerline plugin customizations
" let g:Powerline_symbols = 'fancy'
" call Pl#Theme#ReplaceSegment('lineinfo', 'linesinfo:lineinfo')
" let g:Powerline_mode_n = 'N'
"call Pl#Theme#InsertSegment('filesize', 'after', 'fileinfo')
let g:tagbar_left = 1
" integrate silver_searcher with ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:jsx_ext_required = 0

let g:DisableAutoPHPFolding = 1
au FileType php EnableFastPHPFolds

" techniques used to manage NERDTree and file focus prior to NERDTreeTabs
"autocmd BufWinEnter * NERDTreeTabsFind
"autocmd VimEnter * NERDTree
" close vim if NERDTree is the only buffer left open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" turn off tern preview window
autocmd BufEnter * set completeopt-=preview

set autowrite
augroup AutoWrite
  autocmd! BufLeave * :update
augroup END

"autocmd Syntax c,cpp,vim,xml,html,xhtml,js,rb setlocal foldmethod=syntax
"autocmd Syntax c,cpp,vim,xml,html,xhtml,perl,js,rb normal zR

"if &grepprg ==# 'grep -n $* /dev/null'
  "set grepprg=grep\ -rnH\ --exclude='.*.swp'\ --exclude='*~'\ --exclude='*.log'\ --exclude=tags\ $*\ /dev/null
"endif

" smarty syntax
au BufRead,BufNewFile *.tpl set filetype=smarty

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>

"" tabline customizations
hi TabLineSel ctermfg=DarkBlue ctermbg=White
hi TabLine ctermfg=White ctermbg=DarkBlue

"set tabline=%!MyTabLine()  " custom tab pages line
"function MyTabLine()
  "let s = '' " complete tabline goes here
  "" loop through each tab page
  "for t in range(tabpagenr('$'))
    "" set highlight
    "if t + 1 == tabpagenr()
      "let s .= '%#TabLineSel#'
    "else
      "let s .= '%#TabLine#'
    "endif
    "" set the tab page number (for mouse clicks)
    "let s .= '%' . (t + 1) . 'T'
    "let s .= ' '
    "" set page number string
    "let s .= t + 1 . ' '
    "" get buffer names and statuses
    "let n = ''      "temp string for buffer names while we loop and check buftype
    "let m = 0       " &modified counter
    "let bc = len(tabpagebuflist(t + 1))     "counter to avoid last ' '
    "" loop through each buffer in a tab
    "for b in tabpagebuflist(t + 1)
      "" buffer types: quickfix gets a [Q], help gets [H]{base fname}
      "" others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
      "if getbufvar( b, "&buftype" ) == 'help'
        "let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
      "elseif getbufvar( b, "&buftype" ) == 'quickfix'
        "let n .= '[Q]'
      "else
        "let n .= pathshorten(bufname(b))
      "endif
      "" check and ++ tab's &modified count
      "if getbufvar( b, "&modified" )
        "let m += 1
      "endif
      "" no final ' ' added...formatting looks better done later
      "if bc > 1
        "let n .= ' | '
      "endif
      "let bc -= 1
    "endfor
    "" add modified label [n+] where n pages in tab are modified
    "if m > 0
      "let s .= '[' . m . '+]'
    "endif
    "" select the highlighting for the buffer names
    "" my default highlighting only underlines the active tab
    "" buffer names.
    "if t + 1 == tabpagenr()
      "let s .= '%#TabLineSel#'
    "else
      "let s .= '%#TabLine#'
    "endif
    "" add buffer names
    "if n == ''
      "let s.= '[New]'
    "else
      "let s .= n
    "endif
    "" switch to no underlining and add final space to buffer list
    "let s .= ' '
  "endfor
  "" after the last tab fill with TabLineFill and reset tab page nr
  "let s .= '%#TabLineFill#%T'
  "" right-align the label to close the current tab page
  "if tabpagenr('$') > 1
    "let s .= '%=%#TabLineFill#%999Xclose'
  "endif
  "return s
"endfunction

if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal
endif

if &term =~ '^xterm'
  " solid underscore
  let &t_SI .= "\<Esc>[3 q"
  " solid block
  let &t_EI .= "\<Esc>[4 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif
