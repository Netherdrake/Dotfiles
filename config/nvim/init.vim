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
Plug 'jlanzarotta/bufexplorer'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'

" search
Plug 'henrik/vim-indexed-search'
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
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" togglable panels
Plug 'voldikss/vim-floaterm'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
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
Plug 'python-mode/python-mode', { 'for': 'python' }
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'cespare/vim-toml', { 'for': 'toml' }

" C++
Plug 'derekwyatt/vim-fswitch'

" R
Plug 'jalvesaq/Nvim-R', { 'for': 'R' }
" Plug 'chrisbra/csv.vim'
" Plug 'vim-pandoc/vim-rmarkdown'
" Plug 'gaalcaras/ncm-R'

" markdown
Plug 'preservim/vim-pencil'

" debugging
Plug 'puremourning/vimspector', { 'for': 'python' }
" Plug 'epheien/termdbg', { 'for': 'python' }

" enable neovim builtin plugin
packadd termdebug

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
set scrolloff=3
set autoread

" backup/persistance settings
set undodir=~/.vim/tmp/undo/
set backupdir=~/.vim/tmp/backup/
set directory=~/.vim/tmp/swap/
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
" tnoremap <Esc> <C-\><C-n>

" visual reselect of just pasted
nnoremap gp `[v`]

" make enter break and do newlines
nnoremap <CR> i<CR><Esc>==

" quick way to shift text forward
nnoremap <C-Space> i<Space><Esc>l

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
nnoremap <leader>1 :FloatermToggle<CR>
tnoremap <leader>1 <C-\><C-n>:FloatermToggle<CR>
nnoremap <leader>2 :FloatermNew --disposable nnn<CR>
lua require'trouble'.setup()
nnoremap <leader>3 <cmd>TroubleToggle<cr>
nnoremap <leader>4 :TagbarToggle<CR>
nnoremap <leader>5 :NERDTreeToggle<CR>
nnoremap <leader>6 :Telescope git_status<CR>
nnoremap <expr> <leader>0 ':call ToggleDarkMode()'."<CR>"."<CR>"
" nnoremap <expr> <leader>0 ':set background='.(&background=='dark' ? "light" : "dark")."<CR>".':AirlineRefresh <CR>'


nnoremap <F2> :Telescope man_pages sections=1,2,3<CR>
nnoremap <F3> :Telescope help_tags<CR>
nnoremap <F4> :Telescope commands<CR>

""""""""""""""""""""""""""""""""
"
" Plugin Config
"
""""""""""""""""""""""""""""""""

" easy-motion bindings
lua require'hop'.setup()
nmap <leader>f :HopPattern<CR>

" clever-f prompt
let g:clever_f_show_prompt = 1
let g:clever_f_across_no_line = 1

" floatterm
let g:floaterm_shell = "fish"
let g:floaterm_width  = 0.8
let g:floaterm_height = 0.8
let g:floaterm_keymap_toggle = '<F1>'

" airline
if !exists("g:airline_symbols")
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#empty_message  =  "---"
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


" configure universal ctags
" let g:tagbar_ctags_bin = '/snap/bin/universal-ctags'
" univesal ctags installed via ubuntu snap don't have read access to /tmp
let g:tagbar_use_cache = 0

" git
let g:gitgutter_enabled = 1
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
nnoremap <leader>g :Git 

" telescope
nnoremap <C-p> :Telescope find_files<CR>
nnoremap <leader>a :Telescope live_grep<CR>
nnoremap <leader>tr :Telescope oldfiles<CR>
nnoremap <leader>ts :Telescope git_status<CR>
nnoremap <leader>tf :Telescope git_files<CR>
nnoremap <leader>tc :Telescope git_commits<CR>

lua <<EOF
local actions = require("telescope.actions")
require("telescope").setup{
defaults = {
    mappings = {
        n = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next
            },
        i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next
            },
        },
    },
    pickers = {
        find_files = {
            -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
    },
}
EOF


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
      vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, bufopts)
      vim.keymap.set('n', 'H', vim.lsp.buf.hover, bufopts)
      vim.keymap.set('n', 'gh', vim.lsp.buf.signature_help, bufopts)
      vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
      vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
      vim.keymap.set('n', '<Leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts)
      vim.keymap.set('n', '<Leader>ld', vim.diagnostic.open_float, bufopts)
      vim.keymap.set('n', '<Leader>la', vim.lsp.buf.code_action, bufopts)
      vim.keymap.set('n', '<Leader>lr', vim.lsp.buf.rename, bufopts)
    end

    local lsp_flags = {
      -- This is the default in Nvim 0.7+
      debounce_text_changes = 150,
    }
    require('lspconfig')['pyright'].setup{
        on_attach = on_attach,
        flags = lsp_flags,
    }
    require('lspconfig')['rust_analyzer'].setup{
        on_attach = on_attach,
        flags = lsp_flags,
    }
    require('lspconfig')['clangd'].setup{
        on_attach = on_attach,
        flags = lsp_flags,
    }
    require('lspconfig')['cmake'].setup{
        on_attach = on_attach,
        flags = lsp_flags,
    }
EOF

" Treesitter LSP
lua <<EOF
  require'nvim-treesitter.configs'.setup {
    ensure_installed = {"vim", "lua", "toml", "rust", "python", "c", "cpp", "cuda", "cmake", "markdown" },
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
" let g:slime_no_mappings = 1

" Use '##' to define cells instead of using marks
let g:ipython_cell_delimit_cells_by = 'tags'
let g:ipython_cell_tag = '##'

" Start iPython shell
fu! Ipython()
  :vs | term ipython
  :wincmd r
  :wincmd h
  :SlimeConfig
endfunction
command! Ipython :call Ipython()
command! IPython :call Ipython()

" a hack workaround for terminal not scrolling
function! FixTerminalScroll(bufname)
    let bufmap = map(range(1, winnr('$')), '[bufname(winbufnr(v:val)), v:val]')
    let thewindow = filter(bufmap, 'v:val[0] =~# a:bufname')[0][1]
    execute thewindow 'wincmd w'
    execute thewindow 'normal i'
    call feedkeys("_", "i")
    execute 'sleep 50m'
    call feedkeys("\<BS>", "i")
    execute 'sleep 50m'
    call feedkeys("\<C-\>\<C-n>", "i")
    " execute thewindow 'normal j'
    " execute 'wincmd p'
endfunction

" Rstudio/ipython habit
autocmd FileType python nnoremap <buffer> <leader>r :SlimeSendCurrentLine<CR>
autocmd FileType python vnoremap <buffer> <leader>r :SlimeRegionSend<CR>
autocmd FileType python xnoremap <buffer> <leader>r :SlimeSend<CR>
autocmd FileType python nnoremap <buffer> <leader>cs :call FixTerminalScroll("ipython")<CR>
autocmd FileType python nnoremap <buffer> <leader>cc :IPythonCellExecuteCell<CR>
autocmd FileType python nnoremap <buffer> <leader>cn :IPythonCellExecuteCellJump<CR>
autocmd FileType python nnoremap <buffer> <leader>cr :IPythonCellClose<CR>:IPythonCellClear<CR>
autocmd FileType python nnoremap <buffer> <leader>cd :SlimeSend1 plt.show()<CR>
autocmd FileType python nnoremap <buffer> <leader>ct :IPythonCellRunTime<CR>
autocmd FileType python nnoremap <buffer> <leader>cq :IPythonCellRestart<CR>
autocmd FileType python nnoremap <buffer> <C-d> :IPythonCellNextCell<CR>
autocmd FileType python nnoremap <buffer> <C-u> :IPythonCellPrevCell<CR>

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


" C++ config
function! s:CppMan(target)
    let old_isk = &iskeyword
    setl iskeyword+=:
    let str = expand("<cword>")
    let &l:iskeyword = old_isk
    if a:target ==# 'term'
        execute 'split | term cppman ' . str
    else
        call jobstart('xdg-open "https://en.cppreference.com/mwiki/index.php?title=Special%3ASearch&search=' . str . '"')
    endif
endfunction
au FileType cpp nnoremap <buffer>K :call <SID>CppMan("term")<CR>
au FileType cpp nnoremap <leader>o :call <SID>CppMan("browser")<CR>


" switch between source/header files
au BufEnter *.h let b:fswitchdst = 'c,cpp,m,cc' | let b:fswitchlocs = 'reg:|include.*|src/**|'
au BufEnter *.c let b:fswitchdst = "h"
au BufEnter *.cc let b:fswitchdst = "h,hpp"
nnoremap <silent> gs :FSHere<CR>


" markdown & text files
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


fu ToggleDarkMode()
    if &background == "dark"
        let &background="light"
        :AirlineRefresh
        :!xdotool key -clearmodifiers Shift+F10 r 3
    else
        let &background="dark"
        :AirlineRefresh
        :!xdotool key -clearmodifiers Shift+F10 r 2
    endif
endfunction


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
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o><Esc>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o><Esc>

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

" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
" For tmux, enable:
" https://sunaku.github.io/tmux-24bit-color.html#usage
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if (has("termguicolors"))
    set termguicolors
endif

