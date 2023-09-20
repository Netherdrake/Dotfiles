""""""""""""""""""""""""""""""""
"
" PACKAGE MANAGEMENT
"
""""""""""""""""""""""""""""""""
" start vim-plug
call plug#begin('~/.vim/plugged')

" eye candy
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'vim-airline/vim-airline'

" core plugins
Plug 'jlanzarotta/bufexplorer'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'shortcuts/no-neck-pain.nvim'

" search
Plug 'henrik/vim-indexed-search'
Plug 'phaazon/hop.nvim'
Plug 'rhysd/clever-f.vim'

" typing automations
Plug 'tpope/vim-surround'
Plug 'vim-scripts/tComment'

" autocomplete
Plug 'ycm-core/YouCompleteMe'
Plug 'ervandew/supertab'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" togglable panels
Plug 'voldikss/vim-floaterm'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'preservim/tagbar'
Plug 'folke/trouble.nvim'

" active panel highlighting
" Plug 'TaDaa/vimade'

" LSP
Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-treesitter/nvim-treesitter'
Plug 'ray-x/lsp_signature.nvim'
Plug 'dense-analysis/ale'

" Python
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'cespare/vim-toml', { 'for': 'toml' }

" Haskell
Plug 'mrcjkb/haskell-tools.nvim', { 'for': 'haskell' }

" C++
Plug 'derekwyatt/vim-fswitch'

" markdown
Plug 'preservim/vim-pencil', { 'for': 'markdown' }

" debugging
Plug 'puremourning/vimspector', { 'for': ['haskell', 'python', 'cpp', 'c'] }

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
set number "relativenumber
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

" disable help screen
nmap <F1> <nop>
imap <F1> <nop>

" visual reselect of just pasted
nnoremap gp `[v`]

" make enter break and do newlines
nnoremap <CR> i<CR><Esc>==

" quick way to shift text forward
nnoremap <C-Space> i<Space><Esc>l

" better scrolling
nnoremap <C-j> <C-d>zz
nnoremap <C-k> <C-u>zz

" consistent menu navigation
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

" reload all open buffers
nnoremap <leader>Ra :tabdo exec "windo e!"<CR>

" set current file dir as cwd
nnoremap <leader>C :cd %:p:h<CR>
nnoremap <C-g> :echo expand('%:p:h')<CR>

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
vnoremap <leader>s :%s /

" open vimrc
nnoremap <leader>v :e  ~/.config/nvim/init.vim<CR>
nnoremap <leader>V :so ~/.config/nvim/init.vim<CR>


" shortcuts for togglables and popups
nnoremap <leader>` :FloatermNew --disposable top -u user<CR>
nnoremap <leader>1 :FloatermToggle<CR>
tnoremap <leader>1 <C-\><C-n>:FloatermToggle<CR>
nnoremap <leader>2 :FloatermNew --disposable ranger<CR>
lua require'trouble'.setup()
nnoremap <leader>3 <cmd>TroubleToggle<cr>
nnoremap <leader>4 :TagbarToggle<CR>
nnoremap <leader>5 :NERDTreeToggle<CR>
nnoremap <leader>6 :Telescope git_status<CR>
nnoremap <leader>8 :term time make run<CR>
nnoremap <leader>9 :term time make test<CR>
" nnoremap <expr> <leader>- ':call ChangeTheme()'."<CR>"."<CR>"
nnoremap <leader>0 :NoNeckPain<CR> :NoNeckPainResize 150<CR>
nnoremap <leader>- :NoNeckPainWidthDown<CR>
nnoremap <leader>= :NoNeckPainWidthUp<CR>


nnoremap <F1> :Telescope help_tags<CR>
nnoremap <F2> :Telescope man_pages sections=1,2,3<CR>
" nnoremap <F4> :Telescope commands<CR>


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

" airline
if !exists("g:airline_symbols")
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts=1
let g:airline_section_y = 0
let g:airline_section_error = 0
let g:airline_section_warning = 0
let g:airline_symbols.notexists = ''
let g:airline_symbols.colnr = ':'
let g:airline_symbols.linenr = ' '
let g:airline#extensions#branch#empty_message  =  "---"
let g:airline#extensions#whitespace#enabled    =  0
let g:airline#extensions#tabline#enabled       =  1
let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
let g:airline#extensions#tabline#fnamecollapse =  1 " /a/m/model.rb
let g:airline#extensions#hunks#non_zero_only   =  1 " git gutter

" ALE
let g:ale_virtualtext_cursor = '0' " all
let g:ale_completion_autoimport = 0
" let g:ale_set_highlights = 0
" let g:ale_use_neovim_diagnostics_api = 1

" YouCompleteMe
let g:ycm_filetype_blacklist = {}
let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []
let g:ycm_key_invoke_completion = "<C-j>"
let g:ycm_collect_identifiers_from_tags_files = 1

" python
" let g:ycm_path_to_python_interpreter = '/usr/bin/python3'

" clang
let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_clangd_binary_path = exepath("clangd")
let g:ycm_clangd_args=['--header-insertion=never']


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


" configure nvim -> ipython integration
let g:slime_target = "neovim"
let g:slime_python_ipython = 1

" or have nvim -> tmux -> ipython
let g:slime_target = "tmux"
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{top-right}' }
let g:slime_dont_ask_default = 1

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
autocmd FileType python nnoremap <buffer> <leader>cr :IPythonCellClose<CR>:IPythonCellClear<CR>
autocmd FileType python nnoremap <buffer> <leader>cd :SlimeSend1 plt.show()<CR>
autocmd FileType python nnoremap <buffer> <leader>ct :IPythonCellRunTime<CR>
autocmd FileType python nnoremap <buffer> <leader>cq :IPythonCellRestart<CR>
autocmd FileType python nnoremap <buffer> <C-d> :IPythonCellNextCell<CR>
autocmd FileType python nnoremap <buffer> <C-u> :IPythonCellPrevCell<CR>

if has('clipboard')
    autocmd FileType python nnoremap <buffer> <leader>cc :IPythonCellExecuteCell<CR>
    autocmd FileType python nnoremap <buffer> <leader>cn :IPythonCellExecuteCellJump<CR>
else
    autocmd FileType python nnoremap <buffer> <leader>cc :IPythonCellExecuteCellVerbose<CR>
    autocmd FileType python nnoremap <buffer> <leader>cn :IPythonCellExecuteCellVerboseJump<CR>
endif


" Rust config
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0


" Phind
function! s:Phind(prefix)
    let old_isk = &iskeyword
    setl iskeyword+=:
    let str = expand("<cword>")
    let &l:iskeyword = old_isk
    call jobstart('xdg-open "https://www.phind.com/search?q=' . a:prefix . ' ' . str . '"')
endfunction
au FileType c        nnoremap <leader>p :call <SID>Phind("c")<CR>
au FileType cpp      nnoremap <leader>p :call <SID>Phind("cpp")<CR>
au FileType python   nnoremap <leader>p :call <SID>Phind("python3")<CR>
au FileType rust     nnoremap <leader>p :call <SID>Phind("rust")<CR>
au FileType haskell  nnoremap <leader>p :call <SID>Phind("haskell")<CR>


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


" vimspector
" command! -nargs=+ Vfb call vimspector#AddFunctionBreakpoint(<f-args>)
"
nnoremap <F4>   <Plug>VimspectorBreakpoints
nnoremap <F5>   :call vimspector#Launch()<CR>
" nnoremap <S-F5> :call vimspector#Stop()<CR>
" nnoremap <S-F5> :call vimspector#Reset()<CR>
nnoremap <F6>   :call vimspector#Reset()<CR>
" nnoremap <S-F6> :call vimspector#Restart()<CR>
" nnoremap <F7>   :call vimspector#Pause()<CR>
nnoremap <F7>   :call vimspector#StepOut()<CR>
nnoremap <F8>   :call vimspector#StepOver()<CR>
nnoremap <F9>   :call vimspector#StepInto()<CR>
nnoremap <F10>   :call vimspector#Continue()<CR>
" nnoremap <S-F8> :call vimspector#RunToCursor()<CR>
nnoremap <F11>  :call Vimspector#AddFunctionBreakpoint()<CR>
nnoremap <F12>  :call vimspector#ToggleBreakpoint()<CR>



" markdown & text files
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
let g:pencil#autoformat = 1
let g:pencil#textwidth = 74
let g:pencil#cursorwrap = 1

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  " autocmd FileType text         call pencil#init()
augroup END


""""""""""""""""""""""""""""""""
"
" COLOURS and THEME
"
""""""""""""""""""""""""""""""""

syntax on

colorscheme catppuccin
let g:airline_theme = 'catppuccin'


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


" switch between light and dark mode
fu! ChangeTheme()
    if (&background == "dark")
        let &background="light"
        colorscheme catppuccin-latte
        let g:airline_theme = 'catppuccin'
        :AirlineRefresh
    elseif &background == "light"
        let &background="dark"
        colorscheme catppuccin
        let g:airline_theme = 'catppuccin'
        :AirlineRefresh
    else
        echo "Invalid state"
    endif
endfunction

fu! DisableTheme()
    colorscheme default
    let g:airline_theme='dark'
    :AirlineRefresh
endfunction


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
let g:matchparen_timeout = 2
let g:matchparen_insert_timeout = 2

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


""""""""""""""""""""""""""""""""
"
" LUA configs
"
""""""""""""""""""""""""""""""""


lua <<EOF

-- Telescope

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


-- Nvim LSP

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
        cmd = {"clangd", "--header-insertion=never"},
        on_attach = on_attach,
        flags = lsp_flags,
    }
    require('lspconfig')['cmake'].setup{
        on_attach = on_attach,
        flags = lsp_flags,
    }


-- LSP signature
    require "lsp_signature".setup({
        toggle_key = '<C-c>',
        select_signature_key = '<C-n>',
        hint_enable = true,
        floating_window_above_cur_line = false,
        floating_window_off_x = 200,
        floating_window_off_y = -100,

    })

-- Treesitter LSP

--    require'nvim-treesitter.configs'.setup {
--        ensure_installed = {"vim", "lua", "toml", "rust", "python", "c", "cpp", "cuda", "cmake", "markdown" },
--        auto_install = true,
--        ident = { enable = true },
--        -- highlight = {
--        --     enable = true,
--        --     additional_vim_regex_highlighting = false
--        -- },
--        rainbow = {
--            enable = true,
--            extended_mode = true,
--            max_file_lines = nil,
--        }
--    }
--
-- Diagnostics

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

-- No neck pain

require("no-neck-pain").setup({
    -- width = 150,
    buffers = {
        colors = {
            blend = 0.05,
        },
        scratchPad = {
            -- set to `false` to
            -- disable auto-saving
            enabled = true,
            -- set to `nil` to default 
            -- to current working directory
            location = "~/Documents/",
        },
        bo = {
            filetype = "md"
        },
        wo = {
            fillchars = "eob: ",
        },
    },
})


-- Theme

    require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = { -- :h background
            light = "latte",
            dark = "mocha",
        },
        transparent_background = false,
        show_end_of_buffer = false,
        term_colors = false,
        dim_inactive = {
            enabled = false,
            shade = "dark",
            percentage = 0.80,
        },
        -- color_overrides = {
        --     mocha = {
        --         base = "#000000",
        --         mantle = "#000000",
        --         crust = "#000000",
        --     },
        -- },
         highlight_overrides = {
             mocha = function(C)
             return {
                 TabLineSel = { bg = C.pink },
                 CmpBorder = { fg = C.surface2 },
                 Pmenu = { bg = C.none },
                 TelescopeBorder = { link = "FloatBorder" },
                 }
         end,
         },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        styles = {
            comments = {},
            conditionals = {},
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
        },
        integrations = {
            telescope = true,
            lsp_trouble = false,
            treesitter = true,
            markdown = true,
        },
    })

EOF