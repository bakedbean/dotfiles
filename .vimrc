call pathogen#infect()

" turn off auto adding comments on next line for cut/paste operations
set fo=tcq
set nocompatible
set modeline
set hidden
set encoding=utf-8

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

set rtp+=/usr/local/opt/fzf
set updatetime=100
set re=2

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

highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline

"highlight LineNr ctermfg=grey

hi CursorLineNR cterm=bold ctermfg=166
augroup CLNRSet
    autocmd! ColorScheme * hi CursorLineNR cterm=bold
augroup END

hi Search ctermbg=DarkGray
hi Search ctermfg=White

"hi Normal guibg=NONE ctermbg=NONE

" transparent bg
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
" For Vim<8, replace EndOfBuffer by NonText
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE

highlight Directory ctermfg=172
highlight! link NERDTreeFlags NERDTreeDir

" Enable indentation matching for =>'s
filetype plugin indent on

" key mappings
"noremap <leader>p <Esc>:TagbarToggle<CR>
noremap <leader>o <Esc>:NERDTreeToggle<CR>
" Mirror the NERDTree before showing it. This makes it the same on all tabs.
"nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeFocus<CR>
"noremap <leader>o <Esc>:NERDTreeTabsToggle<CR>
"nmap ,n :NERDTreeTabsFind<CR>
noremap <C-m> :NERDTreeFind<CR>

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
"inoremap <silent> <Esc> <C-O>:stopinsert<CR>
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

" gitgutter show diff from master
nmap gd :GitGutterDiffOrig<CR>

nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
nnoremap <C-Q> :tabclose<CR>

nnoremap <C-f> :Files<CR>
nmap ff :Rg<CR>

:nmap <space>e <Cmd>CocCommand explorer<CR>
nmap <Leader>er <Cmd>call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0'], [['relative', 0, 'file']])<CR>

let g:EasyMotion_startofline = 0
let g:used_javascript_libs = 'angularjs,lo-dash,jquery,jasmine'
" allow command-t to browse more files
let g:CommandTMaxFiles=50000

"let NERDTreeShowBookmarks=1
"let NERDTreeMapOpenVSplit='sd'
"let NERDTreeShowHidden=1
"let g:nerdtree_tabs_autofind=1
"let g:nerdtree_tabs_open_on_console_startup=1
"let g:NERDTreeWinSize = 45
" Change automatically Vim's dir with NERDTree's
"let g:NERDTreeChDirMode = 2
"let g:NERDTreeMapOpenSplit='$'"

" techniques used to manage NERDTree and file focus prior to NERDTreeTabs
"autocmd BufWinEnter * NERDTreeTabsFind
"autocmd VimEnter * NERDTree | wincmd p

" Open the existing NERDTree on each new tab.
"autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
"autocmd BufWinEnter * if getcmdwintype() == '' && &buftype != 'quickfix' | silent! NERDTreeMirror | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" open Nerdtree to current open file when not opened from Nerdtree
"autocmd BufEnter * if &modifiable && &buftype != 'quickfix' | NERDTreeFind | wincmd p | endif

" Check if NERDTree is open or active
"function! IsNERDTreeOpen()
  "return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
"endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
"function! SyncTree()
  "if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    "NERDTreeFind
    "wincmd p
  "endif
"endfunction

" Highlight currently open buffer in NERDTree
"autocmd BufEnter * call SyncTree()

"function! Find_git_root()
  "return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
"endfunction

"command! -nargs=1 Ag execute "Ack! <args> " . Find_git_root()

" close vim if NERDTree is the only buffer left open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Close the tab if NERDTree is the only window remaining in it.
"autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
"autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"     \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#tab_nr_type = 0
let g:airline#extensions#tabline#buffer_idx_mode = 0
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_stl_path_style = 'short'
" remove the filetype part
let g:airline_section_y=''
let g:airline_section_c='%F'
" remove separators for empty sections
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 1
let g:airline_theme='orange'

" taboo
let g:taboo_tab_format = " %f%m %U "

" gitgutter
let g:gitgutter_diff_base = "master"

augroup HITABFILL
  autocmd!
  "autocmd User AirlineAfterInit hi airline_tab_right ctermbg=172
  autocmd User AirlineAfterInit hi airline_tabfill ctermbg=NONE
augroup END

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

let g:ascii = [
          \ '        __',
          \ '.--.--.|__|.--------.',
          \ '|  |  ||  ||        |',
          \ ' \___/ |__||__|__|__|',
          \ ''
          \]

let g:startify_custom_header = ''

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_filetypes = 'html,xhtml,phtml,js'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
let g:closetag_emptyTags_caseSensitive = 1

" turn off YCM hover hints
let g:ycm_auto_hover=''

" vim-js-file-import
let g:js_file_import_use_fzf = 1

" signify setup
let g:signify_number_highlight = 1

"START COC.VIM
" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=100

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

let g:coc_global_extensions = ['coc-solargraph']
"END COC.VIM

" turn off tern preview window
autocmd BufEnter * set completeopt-=preview

set autowrite
augroup AutoWrite
  autocmd! BufLeave * :update
augroup END

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

" start coc-explorer when vim starts
autocmd User CocNvimInit :CocCommand explorer

" start coc-explorer on new tabs
augroup TabEnterAutoCommand
  autocmd!
  autocmd TabNew * call timer_start(200, { tid -> execute(':CocCommand explorer') })
augroup END

" kill coc-explorer when closing buffer
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

"autocmd Syntax c,cpp,vim,xml,html,xhtml,js,rb setlocal foldmethod=syntax
"autocmd Syntax c,cpp,vim,xml,html,xhtml,perl,js,rb normal zR

"if &grepprg ==# 'grep -n $* /dev/null'
  "set grepprg=grep\ -rnH\ --exclude='.*.swp'\ --exclude='*~'\ --exclude='*.log'\ --exclude=tags\ $*\ /dev/null
"endif

" smarty syntax
"au BufRead,BufNewFile *.tpl set filetype=smarty

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

if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;white\x7"
  silent !echo -ne "\033]12;white\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal
endif

if &term =~ '^xterm'
  " solid underscore
  "let &t_SI .= "\<Esc>[4 q"
  " solid block
  let &t_EI .= "\<Esc>[2 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif
