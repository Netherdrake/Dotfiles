set nocompatible
set encoding=utf-8

" start vundler
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin indent on

" vim vundles
Bundle "gmarik/vundle"
Bundle "kien/ctrlp.vim"
Bundle "scrooloose/nerdtree"
Bundle "vim-scripts/taglist.vim"
Bundle "tpope/vim-fugitive"
Bundle "Lokaltog/vim-easymotion"
Bundle "nathanaelkane/vim-indent-guides"
Bundle "Lokaltog/vim-powerline"
Bundle "editorconfig/editorconfig-vim"
Bundle "mileszs/ack.vim"
Bundle "flazz/vim-colorschemes"

" code manipulation tools
Bundle "ervandew/supertab"
Bundle "vim-scripts/tComment"

" language vundles
Bundle "pangloss/vim-javascript"
Bundle "vim-ruby/vim-ruby"
Bundle "tpope/vim-rails"
Bundle "thoughtbot/vim-rspec"
Bundle "fsouza/go.vim"
Bundle "nsf/gocode"

" problematic vundles
Bundle "wincent/Command-T"
Bundle "tpope/vim-pathogen"
" Bundle "Lokaltog/powerline"
" Bundle "garbas/vim-snipmate"

"start pathogen
execute pathogen#infect()

" general configs
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set autoindent
set expandtab
set ruler
set hidden
set ignorecase
set smartcase
set showmatch
set incsearch
set hls
set number ls=2
set cursorline
set nowrap
"set title
"set cursorline
let mapleader=","
set guitablabel=%N/\ %t\ %M
au VimResized * exe "normal! \<c-w>="

set pastetoggle=<F2>
"set clipboard=unnamed

" show trailing whitespaces
set list
set listchars=tab:▸\ ,trail:¬,nbsp:.,extends:❯,precedes:❮
autocmd filetype html,xml set listchars-=tab:▸\ "dont remove comment

" ControlP Start
let g:ctrlp_map = '<c-p>'

"make sure we have colors right
syntax on
set t_Co=256
set background=dark
colorscheme candyman  "wombat256mod very nice
"set colorcolumn=100
highlight ColorColumn ctermbg=233
set tw=99
" indent helpers <leader>ig

"make enter break and do newlines
nnoremap <CR> O<Esc>j
nnoremap <leader>j i<CR><Esc>

"make space in normal mode add space
nnoremap <Space> i<Space><Esc>l

"some togglables
nnoremap <leader>a :set number ls=2<CR>
nnoremap <leader>s :set nonumber ls=1<CR>
nnoremap <leader>r :NERDTreeToggle<CR>
nnoremap <F5> :CommandTFlush<CR>
nnoremap <F3> :TlistToggle<CR>

"map next-previous files
nnoremap <leader>m :bp<CR>
nnoremap <leader>. :bn<CR>

"ms 4000 mappings
nnoremap <PageUp> {
nnoremap <PageDown> }

"alt+key mappings
nnoremap <M-1> 1gt
nnoremap <M-2> 2gt
nnoremap <M-3> 3gt
nnoremap <M-4> 4gt
nnoremap <M-5> 5gt
nnoremap <M-6> 6gt
nnoremap <M-0> 0gt

"backup dir not to clutter
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backupskip=/tmp/*,/private/tmp/*"
set nobackup
set nowritebackup
set noswapfile

"lets cheat with mouse
" set mouse=a

"history
set history=1000
set undolevels=1000

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" ruby specific stuff
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Rspec.vim mappings
map <Leader>Rt :call RunCurrentSpecFile()<CR>
map <Leader>Rs :call RunNearestSpec()<CR>
map <Leader>Rl :call RunLastSpec()<CR>

" Golang compile TODO
" Golang autocomplete TODO

" Text Highlighter = <leader>hx
function! HiInterestingWord(n) " {{{
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction " }}}


nnoremap <leader>hh :call clearmatches()<CR>:noh<CR>
nnoremap <silent> <leader>h1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>h2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>h3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>h4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>h5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>h6 :call HiInterestingWord(6)<cr>

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

" Visual Mode */# from Scrooloose {{{
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" Motions to Ack for things.  Works with pretty much everything, including:
"
"   w, W, e, E, b, B, t*, f*, i*, a*, and custom text objects
"
" Awesome.
"
" Note: If the text covered by a motion contains a newline it won't work.  Ack
" searches line-by-line.

nnoremap <silent> <leader>A :set opfunc=<SID>AckMotion<CR>g@
xnoremap <silent> <leader>A :<C-U>call <SID>AckMotion(visualmode())<CR>

nnoremap <bs> :Ack! '\b<c-r><c-w>\b'<cr>
xnoremap <silent> <bs> :<C-U>call <SID>AckMotion(visualmode())<CR>

function! s:CopyMotionForType(type)
    if a:type ==# 'v'
        silent execute "normal! `<" . a:type . "`>y"
    elseif a:type ==# 'char'
        silent execute "normal! `[v`]y"
    endif
endfunction

function! s:AckMotion(type) abort
    let reg_save = @@

    call s:CopyMotionForType(a:type)

    execute "normal! :Ack! --literal " . shellescape(@@) . "\<cr>"

    let @@ = reg_save
endfunction

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" automatically save and restore folds
autocmd BufWinLeave * if expand("%") != "" | mkview | endif
autocmd BufWinEnter * if expand("%") != "" | loadview | endif
