""""""""""""""""""""""""""""""""
"
" SETTINGS & KEYBINDINGS
"
""""""""""""""""""""""""""""""""
set encoding=utf-8
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set hidden
set ignorecase
set smartcase
set showmatch
set incsearch
set hls
set relativenumber
set ls=2
set nowrap
set backspace=indent,eol,start
set completeopt -=preview
set textwidth=100
set wildmenu
set noshowmode
set cmdheight=1
set nofoldenable
set ruler
" set autoread

" backup/persistance settings
set undodir=/tmp
set backupdir=/tmp
set directory=/tmp
set backup
set writebackup
set noswapfile

" set <leader>
let mapleader=","
map <Space> <leader>

" enable mouse
set mouse=a

" built-in file explorer
nnoremap <leader>5 :Ex<CR>

" visual reselect of just pasted
nnoremap gp `[v`]

"make enter break and do newlines
nnoremap <CR> i<CR><Esc>==
" nnoremap <CR> O<Esc>j
nnoremap <leader>j i<CR><Esc>==

"make space in normal mode add space
nnoremap <Space> i<Space><Esc>l

" better scrolling
nnoremap <C-j> <C-d>zz
nnoremap <C-k> <C-u>zz

" consistent menu navigation
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

" Move highlighted text
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" reload all open buffers
nnoremap <leader>Ra :tabdo exec "windo e!"

"map next-previous jumps
nnoremap <leader>m <C-o>
nnoremap <leader>. <C-i>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Use sane regexes
nnoremap <leader>/ /\v

" Use regular replace
nnoremap <leader>s :%s /

" open vimrc
nnoremap <leader>v :e  ~/.vimrc<CR>
nnoremap <leader>V :tabnew  ~/.vimrc<CR>


" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" clear searches
nnoremap <leader>hh :call clearmatches()<CR>:noh<CR>

""""""""""""""""""""""""""""""""
"
" BUG WORKAROUNDS
"
""""""""""""""""""""""""""""""""

" macos vs linux clipboard
if has("mac")
  set clipboard+=unnamed
else
  set clipboard=unnamedplus
endif


" realign buffers when iterm goes fullscreen
augroup FixProportionsOnResize
  au!
  au VimResized * exe "normal! \<c-w>="
augroup END

" vim mode-switch lag fix
if ! has("gui_running")
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" make C-a, C-x work properly
set nrformats=

" make C-j work consistent in C programms
let g:C_Ctrl_j='off'

" potential lag fix
let g:matchparen_insert_timeout=1

" fix bufexplorer bug with hidden
let g:bufExplorerFindActive=0

" alternative approach for lines that are too long
set colorcolumn=

