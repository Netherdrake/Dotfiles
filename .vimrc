" not a vi
set nocompatible
set encoding=utf-8

" switch between YCM and NeoComplete
let neocomplete_mode = 1
if has("mac")
  let neocomplete_mode = 0
endif

" start vundler
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" core plugins
Bundle "gmarik/vundle"
Bundle "flazz/vim-colorschemes"
Bundle "kien/ctrlp.vim"

" vim main plugins
Bundle "sjl/gundo.vim"
Bundle "bling/vim-airline"
Bundle "jlanzarotta/bufexplorer"
Bundle "scrooloose/syntastic.git"
Bundle "vim-scripts/tComment"
Bundle "tpope/vim-surround"
Bundle "mileszs/ack.vim"
Bundle "rking/ag.vim"
Bundle "edsono/vim-matchit"
Bundle "tpope/vim-fugitive"
Bundle "henrik/vim-indexed-search"
Bundle "tpope/vim-abolish"
Bundle "tpope/vim-repeat"
Bundle "jiangmiao/auto-pairs"
Bundle "xolox/vim-session"
Bundle "xolox/vim-misc"
Bundle "editorconfig/editorconfig-vim"
Bundle "godlygeek/tabular"
Bundle "airblade/vim-gitgutter"
Bundle "Lokaltog/vim-easymotion"
Bundle "rhysd/clever-f.vim"

" togglable panels
Bundle "scrooloose/nerdtree"
Bundle "tpope/vim-vinegar"
Bundle "vim-scripts/taglist.vim"
Bundle "majutsushi/tagbar"

" language vundles
Bundle "pangloss/vim-javascript"
Bundle "marijnh/tern_for_vim"
Bundle "kchmck/vim-coffee-script"
Bundle "othree/javascript-libraries-syntax.vim"

Bundle "vim-ruby/vim-ruby"
Bundle "tpope/vim-rails"
Bundle "kana/vim-textobj-user"
Bundle "nelstrom/vim-textobj-rubyblock"

Bundle "Blackrush/vim-gocode"
Bundle "dgryski/vim-godef"

Bundle "dart-lang/dart-vim-plugin"

" databases
Bundle "krisajenkins/dbext.vim"
Bundle "vim-scripts/SQLComplete.vim"
Bundle "vim-scripts/SQLUtilities"
Bundle "NagatoPain/AutoSQLUpperCase.vim"
" Bundle "vim-scripts/dbext.vim"

" experimental vundles
" Bundle "gorodinskiy/vim-coloresque.git"
" Bundle "maxbrunsfeld/vim-yankstack"

if neocomplete_mode == 1
  Bundle "Shougo/neocomplete"
  Bundle "Shougo/neosnippet"
  Bundle "honza/vim-snippets"
  Bundle "Shougo/echodoc.vim"
else
  Bundle "Valloric/YouCompleteMe"
  Bundle "MarcWeber/vim-addon-mw-utils"
  Bundle "tomtom/tlib_vim"
  Bundle "garbas/vim-snipmate"
  Bundle "honza/vim-snippets"
endif

" enable all the plugins
filetype plugin indent on

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
set shell=/bin/bash
set completeopt -=preview
set textwidth=95
set wildmenu
set ttyfast
set noshowmode
set cmdheight=1
" set autoread

let mapleader=","

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

" macos vs linux clipboard
if has("mac")
  set clipboard+=unnamed
else
  set clipboard=unnamedplus
endif

" make C-a, C-x work properly
set nrformats=

" potential lag fix
let g:matchparen_insert_timeout=1

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

" backup/persistance settings
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backupskip=/tmp/*,/private/tmp/*"
set backup
set writebackup
set noswapfile

" persist (g)undo tree between sessions
set undofile
set history=100
set undolevels=100

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

"make enter break and do newlines
nnoremap <CR> O<Esc>j
nnoremap <leader>j i<CR><Esc>==

"make space in normal mode add space
nnoremap <Space> i<Space><Esc>l

" consistent menu navigation
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

" intellij style autocomplete shortcut
inoremap <C-@> <C-x><C-o>
inoremap <C-Space> <C-x><C-o>

" togglables without FN keys
nnoremap <leader>1 :GundoToggle<CR>
set pastetoggle=<leader>2
nnoremap <leader>3 :TlistToggle<CR>
nnoremap <leader>4 :TagbarToggle<CR>
nnoremap <leader>5 :NERDTreeToggle<CR>

" ctrlP config
let g:ctrlp_map = "<c-p>"
nnoremap <leader>t :CtrlPMRU<CR>
nnoremap <leader>bp :CtrlPBuffer<CR>

" clever-f prompt
let g:clever_f_show_prompt = 1
let g:clever_f_across_no_line = 1

" easy motion rebinded
nmap <leader>f <Plug>(easymotion-f2)
nmap <leader>F <Plug>(easymotion-F2)
" let g:EasyMotion_mapping_f = "<leader>f"
" let g:EasyMotion_mapping_F = "<leader>F"
" let g:EasyMotion_mapping_w = "<leader>w"
" let g:EasyMotion_mapping_b = "<leader>W"

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

" Use :Subvert search
nnoremap <leader>// :S /
vnoremap <leader>// :S /

" Use regular replace
nnoremap <leader>s :%s /
vnoremap <leader>s :%s /

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
let g:gitgutter_enabled = 1
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
nnoremap <leader>G mG:Git! 
nnoremap <leader>g :Git 
nnoremap <leader>A :!ag 
nnoremap <leader>a :Ag! 

" " ack motion (eg. ,amiw finds current word like ,A C-rC-w)
" nnoremap <silent> <lnnoremapeader>w :set opfunc=<SID>AckMotion<CR>g@
" xmap <silent> <leader>w :<C-U>call <SID>AckMotion(visualmode())<CR>

" reload ctags
nnoremap <leader>C :!ctags -R --exclude=.git --exclude=log --exclude=tmp *<CR><CR>

" ctag ruby gems
set tags+=gems.tags

" Golang settings
if has("mac")
  let g:gofmt_command = 'goimports'
endif
let g:godef_split=0

function! GoFmt()
    try
        silent undojoin
        silent exe "Fmt"
        silent retab
    catch
    endtry
endfunction

augroup Golang
  autocmd!
  au FileType go au BufWritePre <buffer> call GoFmt()
  " au FileType go au BufWritePost *.go :silent !gotags *.go > tags
augroup END

" Golang shortcuts
nnoremap <leader>Gr :!go run %<cr>
nnoremap <leader>GR :!go run -race %<cr>
nnoremap <leader>Gt :!go test -v -cover<cr>
nnoremap <leader>GT :!go test -race -v -cover<cr>
nnoremap <leader>Gb :!go build<cr>
nnoremap <leader>GB :!go build -race<cr>
nnoremap <leader>Gi :!go install<cr>

" Ruby shortcuts
nnoremap <Leader>Rr :!ruby %<CR>
nnoremap <Leader>Rf :!zeus rspec %<CR>
nnoremap <Leader>Rt :!rspec<CR>

" Dart shortcuts
nnoremap <leader>Dr :!dart %<cr>

if neocomplete_mode == 1
  " " NEOCOMPLETE (experimental)
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  let g:neocomplete#data_directory = "~/.vim/tmp/swap"
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 2
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

  " Define dictionary.
  let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
          \ }

  " Define keyword.
  if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  " " snipmate rebind
  " imap <C-l> <esc>a<Plug>snipMateNextOrTrigger
  " smap <C-l> <Plug>snipMateNextOrTrigger

  " Plugin key-mappings.
  inoremap <expr><C-g>  neocomplete#undo_completion()
  inoremap <expr><C-l>  neocomplete#complete_common_string()
  inoremap <expr><BS>   neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplete#close_popup()
  inoremap <expr><C-u>  neocomplete#close_popup() . "\<C-u>"
  inoremap <expr><C-h>  neocomplete#smart_close_popup() . "\<C-w>"

  " Plugin key-mappings.
  imap <C-i>     <Plug>(neosnippet_expand_or_jump)
  smap <C-i>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-i>     <Plug>(neosnippet_expand_target)

  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
  endfunction

  " Enable heavy omni completion.
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif

  " neosnippet
  " For snippet_complete marker.
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif

  " Enable snipMate compatibility feature.
  let g:neosnippet#enable_snipmate_compatibility = 1

  " Tell Neosnippet about the other snippets
  let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

  " ruby au's
  augroup RubyCompletion
    au!
    autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
    autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
    autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
    autocmd FileType eruby set filetype=html.eruby
  augroup END

else
  " YouCompleteMe
  let g:ycm_filetype_blacklist = {}
  let g:ycm_key_list_select_completion = []
  let g:ycm_key_list_previous_completion = []
  let g:ycm_key_invoke_completion = "<C-j>"
  let g:ycm_collect_identifiers_from_tags_files = 1
endif

" linked databases
" let g:dbext_default_profile='vincere'
" let g:dbext_default_profile_vincere = 'type=PGSQL:user=vincere:passwd=:dbname=vincere_development'

" angularjs syntasic ovveride
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['html'] }

" enable neocomplete Golang helper
let g:echodoc_enable_at_startup = 1

" enable angular syntax
let g:used_javascript_libs = 'jquery,angularjs'

" retab
fu! Retab()
  :retab
  :%s/\s\+$//
endfunction

" THINGS TODO ON NEW INSTALL
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"
" Inside of ~/.vim make /tmp, inside of which mkdir swap backup undo
"
" install ctags, ack, ag
" sudo packer -S silver-searcher-git ack ctags
"
" go get -u code.google.com/p/go.tools/cmd/goimports
" go get -u github.com/nsf/gocode
" go get -v code.google.com/p/rog-go/exp/cmd/godef
" go install -v code.google.com/p/rog-go/exp/cmd/godef
"
" https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
"
" cd ~/.vim/bundle/YouCompleteMe
" ./install.sh --clang-completer
"
" cd .vim/bundle/tern_for_vim/ && npm install
" npm install -g jshint
