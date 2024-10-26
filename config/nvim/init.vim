""""""""""""""""""""""""""""""""
"
" PACKAGE MANAGEMENT
"
""""""""""""""""""""""""""""""""
" start vim-plug
call plug#begin('~/.vim/plugged')

" eye candy
Plug 'rktjmp/lush.nvim'
Plug 'itchyny/lightline.vim'
Plug 'erik-j-d/lightline-paper'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'Netherdrake/austere.vim'
Plug 'yorickpeterse/vim-paper'
Plug 'morhetz/gruvbox'
Plug 'zenbones-theme/zenbones.nvim'

" core plugins
Plug 'jlanzarotta/bufexplorer'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'andymass/vim-matchup'

" search
Plug 'henrik/vim-indexed-search'
Plug 'phaazon/hop.nvim'
Plug 'rhysd/clever-f.vim'

" typing automations
Plug 'tpope/vim-surround'
Plug 'numToStr/Comment.nvim'
Plug 'Wansmer/treesj'

" autocomplete
Plug 'ycm-core/YouCompleteMe'
" Plug 'ervandew/supertab'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" togglable panels
Plug 'voldikss/vim-floaterm'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'preservim/tagbar'
Plug 'folke/trouble.nvim'
Plug 'Vigemus/iron.nvim'
Plug 'folke/which-key.nvim'

" active panel highlighting
" Plug 'TaDaa/vimade'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'ray-x/lsp_signature.nvim'
" Plug 'dense-analysis/ale'

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'mrcjkb/rustaceanvim', { 'for': 'rust' }

" markdown
Plug 'preservim/vim-pencil', { 'for': 'markdown' }

" debugging
Plug 'puremourning/vimspector', { 'for': ['python', 'cpp', 'c'] }


call plug#end()


" OCaml
let g:opamshare = substitute(system('opam var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

""""""""""""""""""""""""""""""""
"
" SETTINGS & KEYBINDINGS
"
""""""""""""""""""""""""""""""""
set encoding=utf-8

if has("mac")
    set shell=/opt/homebrew/bin/fish
else
    set shell=/usr/bin/fish
endif

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

" disable netrw
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" set <leader>
let mapleader=","
map <Space> <leader>

" enable mouse
set mouse=a

" disable help screen
nmap <F1> <nop>
imap <F1> <nop>

" avoid save typos
ca w' w
ca w] w
ca w\ w

" visual reselect of just pasted
nnoremap gp `[v`]

" make enter break and do newlines
nnoremap <CR> i<CR><Esc>==

" quick way to shift text forward
nnoremap <C-Space> i<Space><Esc>l

" faster motions
nnoremap <C-h> B
nnoremap <C-l> W

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
nnoremap <leader>2 :FloatermNew --disposable yazi<CR>
lua require'trouble'.setup()
nnoremap <leader>3 :Trouble diagnostics toggle focus=false filter.buf=0<CR>
nnoremap <leader>4 :NvimTreeToggle<CR>
nnoremap <leader>5 :TagbarToggle<CR>
nnoremap <leader>6 :Telescope git_status<CR>
nnoremap <leader>7 :term time make debug<CR>
nnoremap <leader>8 :term time make run<CR>
nnoremap <leader>9 :term time make test<CR>
nnoremap <expr> <leader>0 ':call ToggleTheme()'."<CR>"."<CR>"


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
let g:clever_f_mark_char = 0
let g:clever_f_fix_key_direction = 1

" paren matching
let g:matchup_matchparen_offscreen = {'method': 'popup'}

" floatterm
let g:floaterm_shell = "fish"
let g:floaterm_width  = 0.9
let g:floaterm_height = 0.95

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
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0

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
au FileType rust nnoremap <leader>o :RustLsp openDocs<CR>
au FileType rust nnoremap <leader>e :RustLsp explainError current<CR>

" enable type hints
nnoremap <leader>he :lua vim.lsp.inlay_hint.enable(true)<CR>
nnoremap <leader>hd :lua vim.lsp.inlay_hint.enable(false)<CR>

" switch between source/header files
nnoremap <silent> gs :ClangdSwitchSourceHeader<CR>


" vimspector
" command! -nargs=+ Vfb call vimspector#AddFunctionBreakpoint(<f-args>)
"
nnoremap <leader>dd  :call vimspector#Launch()<CR>
nnoremap <leader>dz  :call vimspector#Stop()<CR>
nnoremap <leader>dr  :call vimspector#Reset()<CR>
nnoremap <leader>dR  :call vimspector#Restart()<CR>
nnoremap <leader>dp  :call vimspector#Pause()<CR>
nnoremap <leader>df  :call vimspector#StepOut()<CR>
nnoremap <leader>dn  :call vimspector#StepOver()<CR>
nnoremap <leader>ds  :call vimspector#StepInto()<CR>
nnoremap <leader>dc  :call vimspector#Continue()<CR>
nnoremap <leader>dt  :call vimspector#RunToCursor()<CR>
nnoremap <leader>db  :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>dB  :call Vimspector#AddFunctionBreakpoint()<CR>
nnoremap <leader>di  <Plug>VimspectorBalloonEval
nnoremap <leader>dib <Plug>VimspectorBreakpoints


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
set termguicolors

let g:theme_set = 0

function! ChangeLightlineColorscheme(new_colorscheme)
  if g:theme_set == 1
      let g:lightline.colorscheme = a:new_colorscheme
      call lightline#init()
      call lightline#colorscheme()
      call lightline#update()
  else
      let g:lightline = {
                  \ 'colorscheme': a:new_colorscheme,
                  \ }
      let g:theme_set = 1
  endif
endfunction

fu! PaperLight()
    set background=light
    colorscheme paper
    highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
    highlight MatchParen guifg=#cc9900 ctermfg=203 guibg=NONE ctermbg=NONE gui=Bold cterm=Bold
    call ChangeLightlineColorscheme('paper')
endfunction

let g:gruvbox_contrast_light = 'soft'
let g:gruvbox_invert_selection = 0

fu! GruvboxLight()
    set background=light
    colorscheme gruvbox
    call ChangeLightlineColorscheme('gruvbox')
endfunction

fu! Gruvbox()
    set background=dark
    colorscheme gruvbox
    call ChangeLightlineColorscheme('gruvbox')
endfunction

fu! Catppuccin()
    set background=dark
    colorscheme catppuccin
    call ChangeLightlineColorscheme('catppuccin')
endfunction

fu! KanagawaBones()
    set background=dark
    " let g:kanagawabones = #{ darkness: 'stark', darken_comments: 30 }
    colorscheme kanagawabones
    call ChangeLightlineColorscheme('kanagawabones')
    colorscheme kanagawabones
endfunction

fu! TokyoBones()
    set background=dark
    let g:tokyobones = #{ darkness: 'stark', darken_comments: 30 }
    colorscheme tokyobones
    call ChangeLightlineColorscheme('tokyobones')
    colorscheme tokyobones
endfunction

fu! ZenbonesLight()
    set background=light
    " let g:zenbones = #{ lightness: 'dim' }
    colorscheme zenbones
    call ChangeLightlineColorscheme('zenbones')
    colorscheme zenbones
endfunction

fu! DefaultTheme()
    set background=dark
    colorscheme austere
    call ChangeLightlineColorscheme('austere')
endfunction

fu! ToggleTheme()
    if (&background == "dark")
        call PaperLight()
    else
        call DefaultTheme()
    endif
endfunction

call DefaultTheme()

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

fu! InitHighlights()
    hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
    hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
    hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
    hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
    hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
    hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195
endfunction
call InitHighlights()

augroup on_colorscheme_change
    au!
    autocmd ColorScheme * call InitHighlights()
augroup END

" blip animation for yanked text
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=300})
augroup END

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

" disable annoying markdown errors
" hi link markdownError Normal

""""""""""""""""""""""""""""""""
"
" LUA configs
"
""""""""""""""""""""""""""""""""

lua <<EOF

-- Nvim Tree

    local function nvim_tree_on_attach(bufnr)
      local api = require "nvim-tree.api"

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = false, silent = true, nowait = true }
      end

      local function nothing()
          return
      end

      vim.keymap.set('n', '<C-[>',   api.tree.change_root_to_parent,      opts('Up'))
      vim.keymap.set('n', '<C-]>',   api.tree.change_root_to_node,        opts('CD'))
      vim.keymap.set('n', '<C-r>',   api.tree.reload,                     opts('Refresh'))
      vim.keymap.set('n', '<C-t>',   api.node.open.tab,                   opts('Open: New Tab'))
      vim.keymap.set('n', '<C-v>',   api.node.open.vertical,              opts('Open: Vertical Split'))
      vim.keymap.set('n', '<C-x>',   api.node.open.horizontal,            opts('Open: Horizontal Split'))
      vim.keymap.set('n', '<BS>',    api.node.navigate.parent_close,      opts('Close Directory'))
      vim.keymap.set('n', '<Esc>',   nothing,                             opts('nil'))
      vim.keymap.set('n', '<CR>',    api.node.open.edit,                  opts('Open'))
      vim.keymap.set('n', '<Tab>',   api.node.open.preview,               opts('Open Preview'))
      vim.keymap.set('n', '.',       api.node.run.cmd,                    opts('Run Command'))
      vim.keymap.set('n', 'a',       api.fs.create,                       opts('Create File Or Directory'))
      vim.keymap.set('n', 'c',       api.fs.copy.node,                    opts('Copy'))
      vim.keymap.set('n', 'd',       api.fs.trash,                        opts('Trash'))
      vim.keymap.set('n', 'E',       api.tree.expand_all,                 opts('Expand All'))
      vim.keymap.set('n', 'F',       api.live_filter.clear,               opts('Clean Filter'))
      vim.keymap.set('n', 'f',       api.live_filter.start,               opts('Filter'))
      vim.keymap.set('n', 'H',       api.tree.toggle_hidden_filter,       opts('Toggle Filter: Dotfiles'))
      vim.keymap.set('n', 'i',       api.node.show_info_popup,            opts('Info'))
      vim.keymap.set('n', 'I',       api.tree.toggle_gitignore_filter,    opts('Toggle Filter: Git Ignore'))
      vim.keymap.set('n', 'J',       api.node.navigate.sibling.last,      opts('Last Sibling'))
      vim.keymap.set('n', 'K',       api.node.navigate.sibling.first,     opts('First Sibling'))
      vim.keymap.set('n', 'm',       api.marks.toggle,                    opts('Toggle Bookmark'))
      vim.keymap.set('n', 'e',       api.node.open.edit,                  opts('Open'))
      vim.keymap.set('n', 'o',       api.node.open.edit,                  opts('Open'))
      vim.keymap.set('n', 'O',       api.node.run.system,                 opts('Open System'))
      vim.keymap.set('n', 'p',       api.fs.paste,                        opts('Paste'))
      vim.keymap.set('n', 'P',       api.node.navigate.parent,            opts('Parent Directory'))
      vim.keymap.set('n', 'q',       api.tree.close,                      opts('Close'))
      vim.keymap.set('n', 'S',       api.tree.search_node,                opts('Search'))
      vim.keymap.set('n', 'r',       api.fs.rename_full,                  opts('Rename: Full Path'))
      vim.keymap.set('n', 'U',       api.tree.toggle_custom_filter,       opts('Toggle Filter: Hidden'))
      vim.keymap.set('n', 'W',       api.tree.collapse_all,               opts('Collapse'))
      vim.keymap.set('n', 'x',       api.fs.cut,                          opts('Cut'))
      vim.keymap.set('n', 'y',       api.fs.copy.filename,                opts('Copy Name'))
      vim.keymap.set('n', 'Y',       api.fs.copy.absolute_path,           opts('Copy Absolute Path'))
      vim.keymap.set('n', '?',       api.tree.toggle_help,                opts('Help'))
    end

    require("nvim-tree").setup({
    on_attach = nvim_tree_on_attach,
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 40,
      },
      renderer = {
        group_empty = true,
      },
      git = {
        enable = false,
      },
      filters = {
        dotfiles = true,
      },
    })

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
      -- How long to wait after idle to send changes to lsp server
      debounce_text_changes = 1000, -- 1s
    }
    require('lspconfig')['pylsp'].setup{
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
    require('lspconfig')['ocamllsp'].setup{
        on_attach = on_attach,
        flags = lsp_flags,
    }
    require('lspconfig')['ols'].setup{
        on_attach = on_attach,
        flags = lsp_flags,
    }

-- Disable LSP highlighting

--     vim.api.nvim_create_autocmd("LspAttach", {
--         callback = function(args)
--         local client = vim.lsp.get_client_by_id(args.data.client_id)
--         client.server_capabilities.semanticTokensProvider = nil
--         end,
--     })

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

--    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--        vim.lsp.diagnostic.on_publish_diagnostics, {
--            -- disable ugly underlines
--            underline = false,
--            virtual_text = false,
--            -- Enable virtual text, override spacing to 4
--            -- virtual_text = {spacing = 4},
--            -- Use a function to dynamically turn signs off
--            -- and on, using buffer local variables
--            signs = true,
--            update_in_insert = false
--        }
--    )

-- Rust lsp
vim.g.rustaceanvim = {
    -- Plugin configuration
    tools = {},
    -- LSP configuration
    server = {
        on_attach = on_attach
    },
    dap = {}
}

-- Iron

    local iron = require("iron.core")
    iron.setup {
        config = {
            -- Whether a repl should be discarded or not
            scratch_repl = false,
            -- Automatically closes the repl window on process end
            close_window_on_exit = true,
            -- Scope of the repl
            -- By default it is one for the same `pwd`
            -- Other options are `tab_based` and `singleton`
            scope = require("iron.scope").singleton,
            -- Your repl definitions come here
            repl_definition = {
                sh = { command = {"fish"} },
                python = require("iron.fts.python").ipython,
            },
            -- How the repl window will be displayed
            -- See below for more information
            repl_open_cmd = require('iron.view').split.vertical.botright("50%", {
              winfixwidth = false,
              winfixheight = true,
              -- any window-local configuration can be used here
              number = false
            }),
            -- repl_open_cmd = require("iron.view").center("90%"),
            -- repl_open_cmd = require("iron.view").split.horizontal.top("30%"),
            -- If the repl buffer is listed
            buflisted = true,
        },
        -- Iron doesn't set keymaps by default anymore.
        -- You can set them here or manually add keymaps to the functions in iron.core
        keymaps = {
            send_motion = "<leader>it",
            visual_send = "<leader>il",
            send_file = "<leader>if",
            send_line = "<leader>il",
            send_until_cursor = "<leader>ir",
            send_mark = "<leader>im",
            mark_motion = "<leader>iic",
            mark_visual = "<leader>iic",
            remove_mark = "<leader>id",
            cr = "<leader>i<cr>",
            interrupt = "<leader>i<leader>",
            exit = "<leader>iq",
            clear = "<leader>ic",
        },
        -- If the highlight is on, you can change how it looks
        -- For the available options, check nvim_set_hl
        highlight = { bold = true },
        -- ignore blank lines when sending visual select lines
        ignore_blank_lines = true,
    }
    -- iron also has a list of commands, see :h iron-commands for all available commands
    vim.keymap.set('n', '<leader>is', '<cmd>IronRepl<cr>')
    vim.keymap.set('n', '<leader>ix', '<cmd>IronRestart<cr>')
    vim.keymap.set('n', '<leader>ih', '<cmd>IronHide<cr>')


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


-- tcomment alternative
require('Comment').setup()

-- split/join
require('treesj').setup()

-- hints
require("which-key").setup({delay=500})

EOF