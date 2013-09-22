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
Bundle "vim-scripts/bufexplorer.zip"
Bundle "scrooloose/syntastic.git"
Bundle "flazz/vim-colorschemes"
Bundle "gorodinskiy/vim-coloresque.git"
Bundle "vim-scripts/tComment"
Bundle "tpope/vim-surround"
Bundle "mileszs/ack.vim"
Bundle "edsono/vim-matchit"
Bundle "Lokaltog/vim-easymotion"
Bundle "tpope/vim-fugitive"
Bundle "henrik/vim-indexed-search"
Bundle "tpope/vim-abolish"
Bundle "tpope/vim-repeat"

Bundle "xolox/vim-session"
Bundle "xolox/vim-misc"
Bundle "Raimondi/delimitMate"

" rarely used
Bundle "editorconfig/editorconfig-vim"
Bundle "nathanaelkane/vim-indent-guides"
Bundle "godlygeek/tabular"

" language vundles
Bundle "pangloss/vim-javascript"
Bundle "othree/javascript-libraries-syntax.vim"
Bundle "vim-ruby/vim-ruby"
" Bundle "tpope/vim-rails"
Bundle "fsouza/go.vim"
Bundle "nsf/gocode"
Bundle "dgryski/vim-godef"
" Bundle "Blackrush/vim-gocode"

" databases
Bundle "vim-scripts/sql_iabbr.vim"
Bundle "vim-scripts/dbext.vim"
Bundle "vim-scripts/SQLComplete.vim"

" experimental vundles
" Bundle "maxbrunsfeld/vim-yankstack"
" Bundle "Lokaltog/powerline"

" autocomplete
Bundle "Shougo/neocomplete"
Bundle "Shougo/neosnippet"
" Bundle "ervandew/supertab"

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
" nmap <C-s> :w<CR>
set clipboard+=unnamed
set shell=/bin/bash
set completeopt-=preview

let mapleader=","
noremap \ ,
set guitablabel=%N/\ %t\ %M
au VimResized * exe "normal! \<c-w>="

" vim powerline lag fix
" set timeoutlen=1000 ttimeoutlen=0
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

" experimental stuff
" set omnifunc=syntaxcomplete#Complete
" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabContextDefaultCompletionType = "<C-n>"

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

" session management
let g:session_directory = '~/.vim/session'
let g:session_autoload = 'no'
let g:session_autosave = 'no'
let g:session_command_aliases = 1
nnoremap <leader>so :OpenSession 
nnoremap <leader>ss :SaveSession<CR>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"backup dir not to clutter
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backupskip=/tmp/*,/private/tmp/*"
set nobackup
set nowritebackup
set noswapfile

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
map <leader>A :!ack 
map <leader>a :Ack 

" ack motion (eg. ,amiw finds current word like ,A C-rC-w)
nmap <silent> <leader>w :set opfunc=<SID>AckMotion<CR>g@
xmap <silent> <leader>w :<C-U>call <SID>AckMotion(visualmode())<CR>

" reload ctags
nmap <leader>C :!ctags -R --exclude=.git --exclude=log --exclude=tmp *<CR><CR>

" go tabbing
" autocmd FileType go,golang setlocal ts=4
" autocmd FileType go,golang setlocal sts=4
" autocmd FileType go,golang setlocal sw=4
let g:godef_split = 0
function! GoFmt()
    try
        exe "undojoin"
        exe "Fmt"
    catch
    endtry
endfunction
au FileType go au BufWritePre <buffer> call GoFmt()
" au FileType go au BufWritePre <buffer> undojoin | Fmt
au FileType go au BufWritePre <buffer> retab

" Golang compile TODO
map <leader>Gr :!go run %<cr>
map <leader>GR :!go run -race %<cr>
map <leader>Gt :!go test <cr>
map <leader>Gta :!go test *.go<cr>
map <leader>GT :!go test -race %<cr>
map <leader>GTA :!go test -race *.go<cr>
map <leader>Gb :!go build<cr>
map <leader>Gi :!go install<cr>

" ruby specific stuff
set tags+=gems.tags
" autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
" autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
" autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" sweet vim rspec
map <Leader>Rr :!ruby %<CR>
map <Leader>Rf :!zeus rspec %<CR>
map <Leader>Rt :!rspec<CR>

" javascript stuff
let g:used_javascript_libs = "angularjs,jquery"

" THINGS TODO ON NEW INSTALL
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" install ctags and ack
" js requires npm install -g jshint
" make sure to go get -u github.com/nsf/gocode after nsf/gocode
" go get -v code.google.com/p/rog-go/exp/cmd/godef
" go install -v code.google.com/p/rog-go/exp/cmd/godef
" https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard

" tabline stuff from SO
fu! MyTabLabel(n)
let buflist = tabpagebuflist(a:n)
let winnr = tabpagewinnr(a:n)
let string = fnamemodify(bufname(buflist[winnr - 1]), ':t')
return empty(string) ? '[unnamed]' : string
endfu

fu! MyTabLine()
let s = ''
for i in range(tabpagenr('$'))
" select the highlighting
    if i + 1 == tabpagenr()
    let s .= '%#TabLineSel#'
    else
    let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    "let s .= '%' . (i + 1) . 'T'
    " display tabnumber (for use with <count>gt, etc)
    let s .= ' '. (i+1) . ' '

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '

    if i+1 < tabpagenr('$')
        let s .= ' |'
    endif
endfor
return s
endfu
set tabline=%!MyTabLine()


" neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
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

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " return neocomplete#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
" inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType go setlocal omnifunc=gocomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" neosnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" " SuperTab like snippets behavior. (cannot use together with snipMate)
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
