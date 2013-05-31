execute pathogen#infect()
filetype plugin indent on
filetype indent on
set nocompatible "no vi compatibility mode
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
set nohls
set number ls=2
"set title
"set cursorline
let mapleader=","
set guitablabel=%N/\ %t\ %M

"show trailing whitespaces
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
autocmd filetype html,xml set listchars-=tab:>.

"make sure we have colors right
syntax on
set t_Co=256
colorscheme candyman  "wombat256mod very nice
"set colorcolumn=100
highlight ColorColumn ctermbg=233
set tw=99

"make enter break and do newlines
nnoremap <CR> O<Esc>j
nnoremap <leader>j i<CR><Esc>

"make space in normal mode add space
nnoremap <Space> i<Space><Esc>l

"map workspace movements
nnoremap <c-h> <c-w>h<c-w>
nnoremap <c-j> <c-w>j<c-w>
nnoremap <c-k> <c-w>k<c-w>
nnoremap <c-l> <c-w>l<c-w>

"functions I may or may not want
nnoremap <leader>a :set number ls=2<CR>
nnoremap <leader>s :set nonumber ls=1<CR>
nnoremap <leader>r :NERDTreeToggle<CR>
nnoremap <leader>f :CommandTFlush<CR>
nnoremap <F3> :TlistToggle<CR>

"map tab movements
nnoremap <leader>1 :tabp<CR>
nnoremap <leader>2 :tabn<CR>
nnoremap <leader>m :bp<CR>
nnoremap <leader>. :bn<CR>

"ms 4000 mappings
nnoremap <PageUp> {
nnoremap <PageDown> }

"alt+key mappings
nnoremap <M-1> :1gt
nnoremap <M-2> :2gt
nnoremap <M-3> :3gt
nnoremap <M-4> :4gt
nnoremap <M-5> :5gt
nnoremap <M-6> :6gt
nnoremap <M-0> :0gt

"backup dir not to clutter
set backupdir=./.backup,.,/tmp
set directory=.,./.backup,/tmp
set nobackup
set nowritebackup
set noswapfile

"paste mode
set pastetoggle=<F2>
"set clipboard=unnamed

"lets cheat with mouse
"set mouse=a

"history
set history=1000
set undolevels=1000
