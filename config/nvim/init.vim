""""""""""""""""""""""""""""""""
"
" PACKAGE MANAGEMENT
"
""""""""""""""""""""""""""""""""
" start vim-plug
call plug#begin('~/.vim/plugged')

" eye candy
Plug 'morhetz/gruvbox'
Plug 'folke/lsp-colors.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'vim-airline/vim-airline'

" core plugins
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'

" search
Plug 'henrik/vim-indexed-search'
Plug 'mileszs/ack.vim'
Plug 'phaazon/hop.nvim'
Plug 'rhysd/clever-f.vim'

" typing automations
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/tComment'

" autocomplete
" consider trying "hrsh7th/nvim-cmp"
Plug 'ycm-core/YouCompleteMe'
Plug 'ervandew/supertab'

" snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" togglable panels
Plug 'voldikss/vim-floaterm'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'yegappan/taglist'
Plug 'preservim/tagbar'
Plug 'folke/trouble.nvim'

" active panel highlighting
Plug 'TaDaa/vimade'

" language server protocol
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'ray-x/lsp_signature.nvim'
Plug 'dense-analysis/ale' "syntastic successor, autocomplete

" Python
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
Plug 'python-mode/python-mode', { 'for': 'python' }

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
" Plug 'simrat39/rust-tools.nvim' "clashes with nvim-lspconfig
" Plug 'mfussenegger/nvim-dap' "experimental debugger

" R
Plug 'jalvesaq/Nvim-R', { 'for': 'R' }
" Plug 'chrisbra/csv.vim'
" Plug 'vim-pandoc/vim-rmarkdown'
" Plug 'gaalcaras/ncm-R'

" markdown
Plug 'preservim/vim-pencil'

call plug#end()


""""""""""""""""""""""""""""""""
"
" SETTINGS & KEYBINDINGS
"
""""""""""""""""""""""""""""""""
set encoding=utf-8
set shell=/usr/bin/fish

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set ruler
set hidden
set ignorecase
set smartcase
set showmatch
set incsearch
set hlsearch
set relativenumber
set ls=2
set cursorline
set cursorlineopt=line
set nowrap
set backspace=indent,eol,start
set completeopt -=preview
set textwidth=100
set wildmenu
set noshowmode
set cmdheight=1
set nofoldenable
set scrolloff=8
" set autoread

" backup/persistance settings
set undodir=~/.vim/tmp/undo/
set backupdir=~/.vim/tmp/backup/
set directory=~/.vim/tmp/swap/
set backupskip=/tmp/*,/private/tmp/*"
set backup
set writebackup
set noswapfile

" persist (g)undo tree between sessions
set undofile
set history=100
set undolevels=100

" set <leader>
let mapleader=","
map <Space> <leader>

" enable mouse
set mouse=a

" use ESC to switch terminal to normal mode (might break some things)
" consider using Ctrl-W + N
tnoremap <Esc> <C-\><C-n>

" visual reselect of just pasted
nnoremap gp `[v`]

"make enter break and do newlines
nnoremap <CR> i<CR><Esc>==

" make space in normal mode add space
" nnoremap <Space> i<Space><Esc>l

" Paste without overwriting the yank register
xnoremap <leader>p \"_dP

" better scrolling
nnoremap <C-j> <C-d>zz
nnoremap <C-k> <C-u>zz

" consistent menu navigation
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

" reload all open buffers
nnoremap <leader>Ra :tabdo exec "windo e!"

"map next-previous jumps
nnoremap <leader>m <C-o>
nnoremap <leader>. <C-i>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Move highlighted text
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Use sane regexes
nnoremap <leader>/ /\v

" Use regular replace
nnoremap <leader>s :%s /

" open vimrc
nnoremap <leader>v :e  ~/.config/nvim/init.vim<CR>
nnoremap <leader>V :so  ~/.config/nvim/init.vim<CR>


" shortcuts for togglables and popups
nnoremap <leader>1 :FloatermNew fish<CR>
nnoremap <leader>2 :FloatermNew ranger<CR>
nnoremap <leader>3 :TlistToggle<CR>
nnoremap <leader>4 :TagbarToggle<CR>
nnoremap <leader>5 :NERDTreeToggle<CR>
nnoremap <leader>6 <cmd>Telescope live_grep<cr>
lua require'trouble'.setup()
nnoremap <leader>9 <cmd>TroubleToggle<cr>
nnoremap <expr> <leader>0 ':set background='.(&background=='dark' ? "light" : "dark")."<CR>"

""""""""""""""""""""""""""""""""
"
" Plugin Config
"
""""""""""""""""""""""""""""""""

" easy motion rebinded
lua require'hop'.setup()
nmap <leader>f :HopPattern<CR>

" clever-f prompt
let g:clever_f_show_prompt = 1
let g:clever_f_across_no_line = 1


" ctrlP config
let g:ctrlp_map = "<c-p>"
nnoremap <leader>t :CtrlPMRU<CR>
nnoremap <leader>bp :CtrlPBuffer<CR>

let g:ctrlp_user_command = 'rg --files --smart-case --max-depth 5 %s'

" floatterm
let g:floaterm_shell = "fish"
let g:floaterm_width  = 0.8
let g:floaterm_height = 0.8
let g:floaterm_keymap_toggle   = '<F1>'
let g:floaterm_keymap_next     = '<F2>'

" airline
if !exists("g:airline_symbols")
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#empty_message  =  "no .git"
let g:airline#extensions#whitespace#enabled    =  0
let g:airline#extensions#tabline#enabled       =  1
let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
let g:airline#extensions#tabline#fnamecollapse =  1 " /a/m/model.rb
let g:airline#extensions#hunks#non_zero_only   =  1 " git gutter

" YouCompleteMe
let g:ycm_filetype_blacklist = {}
let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []
let g:ycm_key_invoke_completion = "<C-j>"
let g:ycm_collect_identifiers_from_tags_files = 1


" python
" let g:ycm_path_to_python_interpreter = '/usr/bin/python3.11'

" clang
let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_clangd_binary_path = exepath("clangd")

let g:vim_action_ag_escape_chars = '#%.^$*+?()[{\\|'

" configure universal ctags
" let g:tagbar_ctags_bin = '/snap/bin/universal-ctags'
" univesal ctags installed via ubuntu snap don't have read access to /tmp
let g:tagbar_use_cache = 0

" git and ack stuff
let g:gitgutter_enabled = 1
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
nnoremap <leader>g :Git 
nnoremap <leader>a :Ack! 

if executable("rg")
    let g:ackprg='rg --vimgrep --smart-case'
endif


" Nvim LSP
lua <<EOF
    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local bufopts = { noremap=true, silent=true, buffer=bufnr }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', 'gtd', vim.lsp.buf.type_definition, bufopts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
      vim.keymap.set('n', 'gh', vim.lsp.buf.hover, bufopts)
      vim.keymap.set('n', 'gH', vim.lsp.buf.signature_help, bufopts)
      vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
      vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
      vim.keymap.set('n', '<Leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts)
      vim.keymap.set('n', '<Leader>re', vim.lsp.buf.rename, bufopts)
    end

    local lsp_flags = {
      -- This is the default in Nvim 0.7+
      debounce_text_changes = 150,
    }
    require('lspconfig')['pyright'].setup{
        on_attach = on_attach,
        flags = lsp_flags,
    }
    require('lspconfig')['clangd'].setup{
        on_attach = on_attach,
        flags = lsp_flags,
    }
    require('lspconfig')['rust_analyzer'].setup{
        on_attach = on_attach,
        flags = lsp_flags,
    }
EOF

" Treesitter LSP
lua <<EOF
  require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "vim", "lua", "toml", "rust", "python" },
    auto_install = true,
    ident = { enable = true },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
    }
  }
EOF

lua << EOF
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- disable ugly underlines
    underline = false,
    virtual_text = false,
    -- Enable virtual text, override spacing to 4
    -- virtual_text = {spacing = 4},
    -- Use a function to dynamically turn signs off
    -- and on, using buffer local variables
    signs = true,
    update_in_insert = false
  }
)
EOF

" Rope Settings
let ropevim_enable_shortcuts = 1
let g:pymode_rope = 1
let g:pymode_rope_lookup_project = 0 "dont scan parent dir for .ropeproject
let g:pymode_rope_goto_def_newwin = "e"
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 0


" Pymode Options
let g:pymode_python = 'python3'
let g:pymode_options_max_line_length = 100
let g:pymode_options_colorcolumn = 0
let g:pymode_folding = 0        " Turn off code folding
let g:pymode_virtualenv = 1     " Auto fix vim python paths if virtualenv enabled
let g:pymode_motion = 1         " Enable python objects and motion
let g:pymode_trim_whitespaces = 1 "Trim unused white spaces on save
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 5

" debugging
let g:pymode_breakpoint = 1

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_indent = 1

" linting
let g:pymode_lint = 0
let g:pymode_lint_cwindow = 0
let g:pymode_lint_message = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_unmodified = 0
let g:pymode_lint_on_fly = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8'] " 'mccabe']
let g:pymode_lint_signs = 1

"let g:pymode_lint_ignore = "E501,W"
let g:pymode_lint_sort = ['E','C']

" configure nvim -> ipython integration
let g:slime_target = "neovim"
let g:slime_python_ipython = 1
" let g:slime_dont_ask_default = 1

" Use '##' to define cells instead of using marks
let g:ipython_cell_delimit_cells_by = 'tags'
" Rstudio/ipython habit
autocmd FileType python nnoremap <buffer> <CR> :SlimeSendCurrentLine<CR>gj
autocmd FileType python nnoremap <buffer> <leader>r :SlimeSendCurrentLine<CR>
autocmd FileType python xnoremap <buffer> <leader>r :SlimeSend<CR>
autocmd FileType python nnoremap <buffer> <leader>w :IPythonCellRunTime<CR>
autocmd FileType python nnoremap <buffer> <leader>c :IPythonCellExecuteCellJump<CR>
" autocmd FileType python nnoremap <buffer> <C-j> :IPythonCellNextCell<CR>
" autocmd FileType python nnoremap <buffer> <C-k> :IPythonCellPrevCell<CR>
autocmd FileType python nnoremap <buffer> <leader>d :SlimeSend1 plt.show()<CR>
autocmd FileType python nnoremap <buffer> <leader>x :IPythonCellRestart<CR>

" R indentation
augroup r_indent
  autocmd!
  autocmd FileType r set autoindent
  autocmd FileType r set textwidth=80 shiftwidth=2
  autocmd FileType r set softtabstop=2 tabstop=2
augroup END

" Nvim-R config
let R_assign = 0
let R_args = ['--no-save', '--no-restore', '--quiet']
" https://www.visidata.org/
" let R_csv_app = 'terminal:vd'
let R_csv_app = 'tmux new-window vd'
" let R_after_start = ['options(help_type = "html")']
" autocmd FileType r nmap <silent> <LocalLeader>rt :call RAction('glimpse')<CR>
autocmd FileType r nnoremap <buffer> <CR> <Plug>(RDSendLine)


" Rust config
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

" lua <<EOF
"     local rt = require("rust-tools")
"     rt.setup({
"       server = {
"         on_attach = function(_, bufnr)
"           -- Hover actions
"           vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
"           -- Code action groups
"           vim.keymap.set("n", "<Leader>he", rt.inlay_hints.enable, { buffer = bufnr })
"           vim.keymap.set("n", "<Leader>hd", rt.inlay_hints.disable, { buffer = bufnr })
"         end,
"       },
"     })
" EOF


let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
let g:pencil#autoformat = 1
let g:pencil#textwidth = 74
let g:pencil#cursorwrap = 1

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END


""""""""""""""""""""""""""""""""
"
" COLOURS and THEME
"
""""""""""""""""""""""""""""""""

" syntax highlighting
syntax on
" enable light theme
" set background=light
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_contrast_light = "hard"
let g:airline_theme = 'gruvbox'
let g:gruvbox_underline = 0
let g:gruvbox_undercurl = 0
" colorscheme needs to be called after setting contrast
colorscheme gruvbox



""""""""""""""""""""""""""""""""
"
" COOL HACKS
"
""""""""""""""""""""""""""""""""
" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Visual Mode */# from Scrooloose
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" Text Highlighter = <leader>h[1-4]
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

" better retab
fu! Retab()
  :retab
  :%s/\s\+$//
endfunction

" show trailing whitespaces
set list
set listchars=tab:·\ ,trail:¬,nbsp:.,extends:❯,precedes:❮
augroup ListChars2
    au!
    autocmd filetype go set listchars+=tab:\ \ 
    autocmd ColorScheme * hi! link SpecialKey Normal
augroup END

""""""""""""""""""""""""""""""""
"
" BUG WORKAROUNDS
"
""""""""""""""""""""""""""""""""
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

" make C-j work consistent in C programms
let g:C_Ctrl_j='off'

" potential lag fix
let g:matchparen_insert_timeout=1

" fix bufexplorer bug with hidden
let g:bufExplorerFindActive=0

" alternative approach for lines that are too long
set colorcolumn=
" highlight OverLength ctermbg=gray ctermfg=white guibg=#999999
" match OverLength /\%81v.\+/

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

