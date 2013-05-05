execute pathogen#infect()
set nocompatible "no vi compatibility mode
filetype plugin indent on
filetype indent on
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set autoindent
set expandtab
set ruler
set hidden
set smartcase
set showmatch
set incsearch
set nohls
set number
let mapleader=","

"make sure we have colors right
syntax on
set t_Co=256
colorscheme candyman  "wombat256mod very nice
"set colorcolumn=100
highlight ColorColumn ctermbg=233
set tw=99

"make enter break and do newlines
nnoremap <CR> O<Esc>j
 
"map workspace movements
nmap <c-h> <c-w>h<c-w>
nmap <c-j> <c-w>j<c-w>
nmap <c-k> <c-w>k<c-w>
nmap <c-l> <c-w>l<c-w>

"functions I may or may not want
nnoremap <leader>a :set number ls=2<CR>
nnoremap <leader>s :set nonumber ls=1<CR>
nmap <leader>r :NERDTreeToggle<CR>
nnoremap <leader>f :CommandTFlush<CR>

"map tab movements
nnoremap <leader>1 :tabp<CR>
nnoremap <leader>2 :tabn<CR>
nnoremap <leader>m :bp<CR>
nnoremap <leader>. :bn<CR>

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
set history=500
set undolevels=500
