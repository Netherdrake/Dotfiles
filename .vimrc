set nocompatible
set encoding=utf-8

" start vundler
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin indent on

" vim main plugins
Bundle "gmarik/vundle"
Bundle "kien/ctrlp.vim"
Bundle "scrooloose/nerdtree"
Bundle "vim-scripts/taglist.vim"
Bundle "sjl/gundo.vim"
Bundle "Lokaltog/vim-powerline"
Bundle "corntrace/bufexplorer"
Bundle "scrooloose/syntastic.git"
Bundle "flazz/vim-colorschemes"
Bundle "ervandew/supertab"
Bundle "vim-scripts/tComment"
Bundle "tpope/vim-surround"
Bundle "mileszs/ack.vim"
Bundle "edsono/vim-matchit"
Bundle "Lokaltog/vim-easymotion"
Bundle "tpope/vim-fugitive"

" rarely used
Bundle "editorconfig/editorconfig-vim"
Bundle "nathanaelkane/vim-indent-guides"
Bundle "godlygeek/tabular"

" language vundles
Bundle "pangloss/vim-javascript"
Bundle "othree/javascript-libraries-syntax.vim"
Bundle "vim-ruby/vim-ruby"
Bundle "tpope/vim-rails"
Bundle "duskhacker/sweet-rspec-vim"
Bundle "fsouza/go.vim"
Bundle "nsf/gocode"
" Bundle "Blackrush/vim-gocode"

" experimental vundles
Bundle "henrik/vim-indexed-search"
Bundle "tpope/vim-abolish"
Bundle "tpope/vim-repeat"
Bundle "Shougo/neocomplcache.vim"
" Bundle "Lokaltog/powerline"

" snipMate with dependencies
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"

"keeping pathogen only for its 'syntax on' bug workaround
Bundle "tpope/vim-pathogen"
execute pathogen#infect()

" general configs
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=4
set autoindent
set ruler
set hidden
set ignorecase
set smartcase
set showmatch
set incsearch
set hls
set number
set ls=2
set cursorline
set nowrap
"set title
"set cursorline
let mapleader=","
noremap \ ,
set guitablabel=%N/\ %t\ %M
au VimResized * exe "normal! \<c-w>="

" make C-a, C-x work properly
set nrformats=

" experimental auto-complete stuff
set omnifunc=syntaxcomplete#Complete
" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabContextDefaultCompletionType = "<c-p>"

" show trailing whitespaces
set list
set listchars=tab:▸\ ,trail:¬,nbsp:.,extends:❯,precedes:❮
autocmd filetype html,xml set listchars-=tab:▸\ 

"make sure we have colors right
syntax on
set t_Co=256
set background=dark
colorscheme candyman  "wombat256mod very nice
"set colorcolumn=100
highlight ColorColumn ctermbg=233
set tw=99

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
if $TMUX == ""
  set clipboard+=unnamed
else
  set shell=/bin/bash
endif

" visual reselect of just pasted
nnoremap gp `[v`]

"history
set history=1000
set undolevels=1000

"make enter break and do newlines
nnoremap <CR> O<Esc>j
nnoremap <leader>j i<CR><Esc>==

"make space in normal mode add space
nnoremap <Space> i<Space><Esc>l

"some togglables
set pastetoggle=<F2>
nnoremap <F3> :TlistToggle<CR>
nnoremap <F4> :GundoToggle<CR>
nnoremap <F5> :NERDTreeToggle<CR>
let g:ctrlp_map = '<c-p>'
nnoremap <leader>t :CtrlPMixed<CR>

" open vimrc
nnoremap <leader>v :e  ~/.vimrc<CR>
nnoremap <leader>V :tabnew  ~/.vimrc<CR>

" syntastic check
nnoremap <Leader>l :SyntasticCheck<CR>

" reload all open buffers
nmap <leader>ra :tabdo exec 'windo e!'

"map next-previous files
nnoremap <leader>m <C-o>
nnoremap <leader>. <C-i>

" ms 4000 mappings
nnoremap <PageUp> {
nnoremap <PageDown> }

" Use sane regexes
nnoremap <leader>/ /\v
vnoremap <leader>/ /\v

" Verbatim search
nnoremap <leader>// /\V
vnoremap <leader>// /\V

" Use :Subvert search
nnoremap <leader>s :S /
vnoremap <leader>s :S /

" Use :Subvert replace
nnoremap <leader>S :%S /
vnoremap <leader>S :%S /

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Visual Mode */# from Scrooloose
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" Text Highlighter = <leader>hx
function! HiInterestingWord(n)
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
endfunction

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

highlight search ctermfg=white ctermbg=3423513

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=091534
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

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

" " Make sure Vim returns to the same line when you reopen a file.
" " Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" git and ack stuff
map <leader>G mG:Git! 
map <leader>g :Git 
map <leader>A :Ack 
map <leader>a :!ack 

" ack motion (eg. ,amiw finds current word like ,A C-rC-w)
nnoremap <silent> <leader>am :set opfunc=<SID>AckMotion<CR>g@
xnoremap <silent> <leader>am :<C-U>call <SID>AckMotion(visualmode())<CR>

" reload ctags
nmap <leader>c :!ctags -R --exclude=.git --exclude=log --exclude=tmp *<CR><CR>

" go tabbing
autocmd FileType go,golang setlocal ts=4
autocmd FileType go,golang setlocal sts=4
autocmd FileType go,golang setlocal sw=4

" Golang compile TODO
map <leader>Gr :!go run %<cr>

" ruby specific stuff
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" sweet vim rspec
map <Leader>Rf :SweetVimRspecRunFile<CR>
map <Leader>Rs :SweetVimRspecRunFocused<CR>
map <Leader>Rp :SweetVimRspecRunPrevious<CR>
map <Leader>Rr :!rspec %<CR>

" javascript stuff
let g:used_javascript_libs = "angularjs,jquery"

" THINGS TODO ON NEW INSTALL
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" install ctags and ack
" js requires npm install -g jshint
" make sure to go get -u github.com/nsf/gocode after nsf/gocode
