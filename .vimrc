set encoding=utf-8

" start vundler
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin indent on

" core plugins
Bundle "gmarik/vundle"
Bundle "flazz/vim-colorschemes"
Bundle "kien/ctrlp.vim"

" vim main plugins
Bundle "sjl/gundo.vim"
Bundle "bling/vim-airline"
Bundle "vim-scripts/bufexplorer.zip"
Bundle "scrooloose/syntastic.git"
Bundle "vim-scripts/tComment"
Bundle "tpope/vim-surround"
Bundle "mileszs/ack.vim"
Bundle "edsono/vim-matchit"
Bundle "Lokaltog/vim-easymotion"
Bundle "tpope/vim-fugitive"
Bundle "henrik/vim-indexed-search"
Bundle "tpope/vim-abolish"
Bundle "tpope/vim-repeat"
Bundle "vim-scripts/Auto-Pairs"
Bundle "xolox/vim-session"
Bundle "xolox/vim-misc"
Bundle "editorconfig/editorconfig-vim"
Bundle "godlygeek/tabular"

" rarely used
Bundle "scrooloose/nerdtree"
Bundle "airblade/vim-gitgutter"
Bundle "vim-scripts/taglist.vim"
Bundle "majutsushi/tagbar"

" language vundles
Bundle "pangloss/vim-javascript"
Bundle "kchmck/vim-coffee-script"
" Bundle "vim-scripts/SyntaxComplete"
" Bundle "othree/javascript-libraries-syntax.vim"

Bundle "vim-ruby/vim-ruby"
Bundle "kana/vim-textobj-user"
Bundle "nelstrom/vim-textobj-rubyblock"
Bundle "tpope/vim-rails"

Bundle "fsouza/go.vim"
Bundle "dgryski/vim-godef"
Bundle "nsf/gocode"
Bundle "Blackrush/vim-gocode"

" databases
Bundle "vim-scripts/sql_iabbr.vim"
Bundle "vim-scripts/dbext.vim"
Bundle "vim-scripts/SQLComplete.vim"

" experimental vundles
Bundle "chrisbra/color_highlight"
" Bundle "maxbrunsfeld/vim-yankstack"
" Bundle "terryma/vim-multiple-cursors"

" autocomplete
Bundle "Valloric/YouCompleteMe"
" Bundle "Shougo/neocomplete"
" Bundle "Shougo/neosnippet"

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
set relativenumber
set ls=2
set cursorline
set nowrap
set backspace=indent,eol,start
set clipboard=unnamedplus
set shell=/bin/bash
set completeopt-=preview
set textwidth=95
" set autoread

let mapleader=","

" realign buffers when iterm goes fullscreen
augroup FixProportionsOnResize
  au!
  au VimResized * exe "normal! \<c-w>="
augroup END

" vim mode-switch lag fix
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" make C-a, C-x work properly
set nrformats=

" fix bufexplorer bug with hidden
let g:bufExplorerFindActive=0

" show trailing whitespaces
set list
set listchars=tab:▸\ ,trail:¬,nbsp:.,extends:❯,precedes:❮
augroup FileTypes
  autocmd!
  autocmd filetype html,xml set listchars-=tab:▸\ 
augroup END

" syntax highlighting
syntax on
colorscheme candyman

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
nnoremap <leader>so :OpenSession 
nnoremap <leader>ss :SaveSession 
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"backup dir not to clutter
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backupskip=/tmp/*,/private/tmp/*"
set backup
set writebackup
set noswapfile

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

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

" consistent menu navigation
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

"some togglables
set pastetoggle=<F2>
nnoremap <F3> :GitGutterToggle<CR>
nnoremap <F4> :GundoToggle<CR>
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F7> :TlistToggle<CR>
nnoremap <F9> :TagbarToggle<CR>
let g:ctrlp_map = "<c-p>"
nnoremap <leader>t :CtrlPMixed<CR>

" open vimrc
nnoremap <leader>v :e  ~/.vimrc<CR>
nnoremap <leader>V :tabnew  ~/.vimrc<CR>

" syntastic check
nnoremap <Leader>l :SyntasticCheck<CR>

" reload all open buffers
nnoremap <leader>ra :tabdo exec "windo e!"

"map next-previous jumps
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

" airline
if !exists("g:airline_symbols")
  let g:airline_symbols = {}
endif

let g:airline_theme="powerlineish"
let g:airline_powerline_fonts=1
" let g:airline_section_warning = airline#section#create([ "syntastic" ])
let g:airline#extensions#branch#empty_message  =  "No SCM"
let g:airline#extensions#whitespace#enabled    =  0
let g:airline#extensions#syntastic#enabled     =  1
let g:airline#extensions#tabline#enabled       =  1
let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
let g:airline#extensions#tabline#fnamecollapse =  1 " /a/m/model.rb
let g:airline#extensions#hunks#non_zero_only   =  1 " git gutter

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

function! s:CopyMotionForType(type)
    if a:type ==# "v"
        silent execute "normal! `<" . a:type . "`>y"
    elseif a:type ==# "char"
        silent execute "normal! `[v`]y"
    endif
endfunction

function! s:AckMotion(type) abort
    let reg_save = @@

    call s:CopyMotionForType(a:type)

    execute "normal! :Ack! --literal " . shellescape(@@) . "\<cr>"

    let @@ = reg_save
endfunction

if executable("ag")
  let g:ackprg = "ag --nogroup --column"
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" git and ack stuff
let g:gitgutter_enabled = 0
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
nnoremap <leader>G mG:Git! 
nnoremap <leader>g :Git 
nnoremap <leader>A :!ack 
nnoremap <leader>a :Ack 

" ack motion (eg. ,amiw finds current word like ,A C-rC-w)
nnoremap <silent> <leader>w :set opfunc=<SID>AckMotion<CR>g@
xmap <silent> <leader>w :<C-U>call <SID>AckMotion(visualmode())<CR>

" reload ctags
nnoremap <leader>C :!ctags -R --exclude=.git --exclude=log --exclude=tmp *<CR><CR>

let g:godef_split = 0
function! GoFmt()
    try
        exe "undojoin"
        exe "Fmt"
    catch
    endtry
endfunction

augroup Golang
  autocmd!
  au FileType go au BufWritePre <buffer> call GoFmt()
  au FileType go au BufWritePre <buffer> retab
augroup END

" Golang shortcuts
nnoremap <leader>Gr  :!go run %<cr>
nnoremap <leader>GR  :!go run -race %<cr>
nnoremap <leader>Gt  :!go test <cr>
nnoremap <leader>Gta :!go test *.go<cr>
nnoremap <leader>GT  :!go test -race %<cr>
nnoremap <leader>GTA :!go test -race *.go<cr>
nnoremap <leader>Gb  :!go build<cr>
nnoremap <leader>Gi  :!go install<cr>

" ruby specific stuff
set tags+=gems.tags
nnoremap <Leader>Rr :!ruby %<CR>
nnoremap <Leader>Rf :!zeus rspec %<CR>
nnoremap <Leader>Rt :!rspec<CR>
" autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
" autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
" autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" javascript stuff
let g:used_javascript_libs = "angularjs,jquery"

" YouCompleteMe
let g:ycm_filetype_blacklist = {}
let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []
let g:ycm_key_invoke_completion = "<C-j>"
let g:ycm_collect_identifiers_from_tags_files = 1

" THINGS TODO ON NEW INSTALL
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"
" install ctags, ack, ag
" js requires npm install -g jshint
"
" make sure to go get -u github.com/nsf/gocode after nsf/gocode
" go get -v code.google.com/p/rog-go/exp/cmd/godef
" go install -v code.google.com/p/rog-go/exp/cmd/godef
"
" https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
"
" cd ~/.vim/bundle/YouCompleteMe
" ./install.sh --clang-completer
"
" Inside of ~/.vim make /tmp, inside of which mkdir swap backup undo
