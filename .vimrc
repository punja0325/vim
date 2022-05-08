"source %
set nocompatible
filetype off

let g:ale_completion_enabled=1  "set this before loading ALE

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle setup: runtime path and package initializations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle packages
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
"Plugin 'tpope/vim-fugitive'
Plugin 'preservim/nerdtree'
Plugin 'preservim/nerdcommenter'
Plugin 'dense-analysis/ale'
"Plugin 'vhda/verilog_systemverilog.vim'
Plugin 'morhetz/gruvbox'
"Plugin 'fatih/vim-go'
"Plugin 'rust-lang/rust.vim'
"Plugin 'pangloss/vim-javascript'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'mbbill/undotree'
Plugin 'wenlongche/SrcExpl'
Plugin 'vim-scripts/taglist.vim'
"Plugin 'majutsushi/tagbar'
Plugin 'wenlongche/Trinity'
"Plugin 'powerline/fonts'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ggreer/the_silver_searcher'
Plugin 'tomtom/tcomment_vim'
" snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'universal-ctags/ctags'
"
" All of your Plugins  must be added before the following line
call vundle#end()              " required
filetype plugin indent on      " enable file type detection
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Put non-Vundle stuff after this line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO: build some stuff, enhance some plugins in '.vim/after' direction


" FZF plugin for fuzzy search like ctrlp(kien/ctrlp.vom)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Table of Contents
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" - General
" - VIM user interface
" - Files, backups and undo
" - Text, tab and indent related
" - Moving around, tabs windows and buffers
" - Status line
" - Omni complete function
" - Custom Mappings
" - Package Configurations

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"set ttymouse=xterm2

" Set how many lines of history VIM has to remember
set history=5000

" Set to auto read when a file is changed from the outside
set autoread   "type ':e' to force reload NOW

" Set UTF-8 as standard encoding
set encoding=utf-8
scriptencoding utf-8

" Speed up {Insert-mode} -> <Esc> -> {Normal-mode}
" or else Ctrl-c is needed for faster transition
"set noesckeys  "disables direction keys and home/end
set timeout timeoutlen=1000 ttimeoutlen=50
inoremap jj <C-c>




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on the Wide menu
set wildmenu
set wildmode=longest,list

" Ignore compiled file
set wildignore=*.o,*~,*pyc
if has('win16') || has('win32')
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" shows absolute and relative line numbers (hybrid mode)
set number
set relativenumber

augroup LineNumberMode
    autocmd!
    autocmd BufEnter,InsertLeave * let &l:relativenumber = &l:number && 1 | setlocal list
    autocmd BufLeave,InsertEnter * let &l:relativenumber = &l:number && 0 | setlocal nolist
augroup END

" Highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline | setlocal cursorcolumn
    autocmd WinLeave * setlocal nocursorline | set nocursorcolumn
augroup END

" delete trailing whitespace
augroup DeleteTrailingSpace
    autocmd!
    autocmd BufWritePre * :%s/\s\+$//e
augroup END


" Hides mode message on the last line
set noshowmode


" confirms file operation
set confirm

" A buffer becomes hidden when it is abandoned
set hidden

set backspace=indent,eol,start

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

"highlights the textline of the cursor
set cursorline
set cursorcolumn

" enables mouse mode in Visual and Normal mode
set mouse=vn    " includes insert mode and other stuff

" Unbind some useless/annoying default key bindings.
" 'Q' in normal mode enters Ex mode. You almost never want this.
nmap Q <Nop>

" Prevents words be split across line
set linebreak

" Show lines above and below cursor (when possible)
set scrolloff=5

" Highlight trailing whitespace and tabs
augroup TrailingSpaces
    autocmd!
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$\| \+\ze\t\+|\t\+\zs \+/
augroup END


" Automatically set current directory to directory of last opened file
set autochdir

" Render tabs and non-breakable spaces
set list
"set listchars=tab:>-,space:.,nbsp:~
set listchars=tab:>-,nbsp:~

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" suppress inserting tow spaces between sentencs
set nojoinspaces


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Enable 256 colors palette
" NOTE: set by shell env var: TERM
set t_Co=256

" Color scheme package
try
    colorscheme gruvbox
        let g:gruvbox_contrast_dark='hard'
    catch
endtry

set background=dark

"custom color setting
" Highlight Class and Function names
syn match    cCustomParen    "(" contains=cParen,cCppParen
syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
"syn match    cCustomScope    "::"
"syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope

hi def link cCustomFunc  Function
"hi def link cCustomClass Function



" Use Unix as the atandard file type
set ffs=unix,dos


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
"punja
set expandtab

" Be smart when using tab
set smarttab

" 1 $tab = 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4


set autoindent
set smartindent




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup RestoreCursorPosition
    autocmd!
    " Return to last edit position when opening files (You want this!)
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" always show status line
set laststatus=2



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set omnifunc=ale#completion#OmniFunc
"let g:ale_completion_max_suggestions=10


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function SignColumn_toggle() abort
    if &l:number
        setlocal signcolumn=auto
    else
        setlocal signcolumn=no
    endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom Mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" remap leader
"let mapleader=";"

" LEARN TO TYPE CORRECTLY
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Toggle display settings for text-copying
" => NOTE: Toggles line-number column, sign column, and special characters together
" => NOTE: signcolumn setting shadow GitGutter-column settings
nnoremap <C-n> :setlocal number! <bar> let &l:relativenumber = &l:number <bar> call SignColumn_toggle() <CR>

" Enable TAB-completion instead of Just C-o/C-n/C-p
"inoremap <silent> <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <silent> <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\S-Tab>"

" Buffer splitting alias (always creating a new window with it
" => vertical
nnoremap <C-b>\| :vnew <CR>
" => horizontal
nnoremap <C-b>_ :new <CR>
" => close
nnoremap <C-b>w :bdelete <CR>

" Windows splitting alias
" => vertical
nnoremap <C-w>\| :vsplit <CR>
" => vertical
nnoremap <C-w>_ :split <CR>
" => vertical
nnoremap <C-w>w :close <CR>

" pkg:: ALE
nnoremap <C-f> :ALEFix <CR>

" pkg:: fZF.vim
" => [ Find in this File ]: Search text in the current buffer
nnoremap <Leader>ff :BLines <CR>
" => [ Find all ]: Search everything in every file
nnoremap <Leader>fa :Rg <CR>
" => [ ls ]: File name search
nnoremap <Leader>fa :Files <CR>
" => [ Git history in this File ]: Git commits in the current buffer
nnoremap <Leader>gf :BCommits <CR>
" => [ Find all ]: Search everything in every file
nnoremap <Leader>ga :Commits <CR>
" command! -bar GitStatus :gFiles?
" TODO: ':Commands' can view all commands
" TODO: 'Maps'      can view all mappings





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Package Configurations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""
" pkg:: Airline
"""""""""""""""""""""""""""""""
" FIXME: let g:airline_extensions = []
let g:airline_theme='dark'
let g:airline#extensions#tableine#enabled = 1
" BUG: FIXME: default section_z setting is acting weird
"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr      = ' '
let g:airline_symbols.maxlinenr   = ''
let g:airline_symbols.colnr       = ' :'
"let g:airline_powerline_fonts=1

"""""""""""""""""""""""""""""""
" pkg:: GitGutter
"""""""""""""""""""""""""""""""
" Set gutter update frequency
set updatetime=200
" disable all key mappings
let g:gitgutter_map_key=0



"""""""""""""""""""""""""""""""
" pkg:: NerdTree
"""""""""""""""""""""""""""""""
augroup NerdTree_AutoCloseNerdTreeIfIsLastWindow
    " Close the tab if NERDTree is the only window remaining in it.
    autocmd!
    autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
augroup END
" single click will open directories, double click to open files
let NERDTreeIgnore=['\.pyc$', '__pycache__']
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeWinSize=24
let NERDTreeChDirMode=2
let NERDTreeMinimalUI=1

"""""""""""""""""""""""""""""""
" pkg:: NerdCommenter
"""""""""""""""""""""""""""""""
" add spaces after comment delimiters by default
let g:NERDSpaceDelims=1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs=1
" USAGE:
"------------------------------
" while default <leader> is '\'
"
" COMMENT:      cc
"    use '[number of lines]<leader>cc' to comment the current line
" SEXY COMMENT: cs
"    use '[number of lines]<leader>cs' for pretty formatted comments
" UNCOMMENT:    cu
"    use '[number of lines]<leader>cu' to uncomment the selected lines
" UNCOMMENT:    ci
"    use '[number of lines]<leader>ci' to toggle individual line comment

"""""""""""""""""""""""""""""""
" pkg:: vim-go
"""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""
" pkg:: ALE
"""""""""""""""""""""""""""""""
let g:ale_sign_column_always=0
let g:ale_sign_info='+'
let g:ale_sign_error='X'
let g:ale_sign_warning='△'
let g:ale_sign_style_warning='⊘'
let g:ale_sign_style_error='⦿'
" set default height of the error window
let g:ale_list_window_size=3
" ALE:AirLine integration
let g:airline#extensions#ale#enabled = 1
" ALE:Linter Settings
let g:ale_linters={
            \ 'c':               ['cc', 'clangd','clangidy'],
            \ 'cpp':             ['cc', 'clangd','clangidy'],
            \ 'python':          ['flake8', 'mypy'],
            \ 'verilog':         ['verilator'],
            \ 'javascriptreact': ['eslint'],
            \ 'go':              ['gofmt', 'golint', 'gopls'],
            \}
" lang:GO: 'gofmt', 'golint' and 'go vet' are enabled at default
" TODO: enable gotype
" ALE: Fixer Settings
let g:ale_fixers={
            \'python':['yapf'],
            \'c`':    ['clang-format', 'clangtidy'],
            \'cpp`':  ['clang-format', 'clangtidy'],
            \'cuda`': ['clang-format'],
            \'javascriptreact`':['eslint', 'prettier'],
            \'javascript`':['eslint', 'prettier'],
            \'rust`': ['rustfmt'],
            \'go`':   ['gofmt', 'goimports'],
            \'swift`':['apple-swift-format'],
            \'json':  ['prettier'],
            \'html':  ['prettier'],
            \'css':   ['prettier'],
            \}
" C/C++ setting
" project
let g:ale_c_build_dir_names=['build']
let g:ale_c_build_dir='build'
let g:ale_c_parse_compile_commands=1
let g:ale_c_parse_makefile=0
" compiler
let g:ale_c_cc_executable='clang'
let g:ale_cpp_cc_executable='clang++'
let g:ale_c_cc_options  ='-std=c11   -Wall -Wextra -pedantic'
let g:ale_cpp_cc_options='-std=c++17 -Wall -Wextra -pedantic'
" clangd
let g:ale_c_clangd_executable   ='/usr/local/opt/llvm/bin/clangd'
let g:ale_cpp_clangd_executable ='/usr/local/opt/llvm/bin/clangd'
"let g:ale_c_clangd_option      =''
"let g:ale_cpp_clangd_option    =''
" clang-format
let g:ale_c_clangformat_executable ='/usr/local/bin/clang-format'
"let g:ale_c_clangformat_options   = ''
" clang-tidy
let g:ale_c_clangtidy_executable   ='/usr/local/opt/llvm/bin/clang-tidy'
let g:ale_cpp_clangtidy_executable ='/usr/local/opt/llvm/bin/clang-tidy'
"let g:ale_c_clangtidy_checks       =[]
"let g:ale_cpp_clangtidy_checks     =[]
"let g:ale_c_clangtidy_options      =''
"let g:ale_cpp_clangtidy_options    =''
"let g:ale_c_clangtidy_extra_options    =''
"let g:ale_cpp_clangtidy_extra_options  =''
let g:ale_c_clangtidy_fix_errors      =0
let g:ale_cpp_clangtidy_fix_errors    =0

"""""""""""""""""""""""""""""""
" pkg:: Tiriity
"""""""""""""""""""""""""""""""
nmap <C-a> :TrinityToggleAll <CR>
"
"""""""""""""""""""""""""""""""
" pkg:: taglist
"""""""""""""""""""""""""""""""
nmap <F8> :TlistToggle<CR>
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
set ut=100

"""""""""""""""""""""""""""""""
" pkg:: NERDTree
"""""""""""""""""""""""""""""""
nnoremap <C-t> :NERDTreeToggle <CR>

"""""""""""""""""""""""""""""""
" pkg:: UndoTree
"""""""""""""""""""""""""""""""
nnoremap <C-u> :UndotreeToggle<CR>

"""""""""""""""""""""""""""""""
" pkg:: srcexpltoggle
"""""""""""""""""""""""""""""""
nmap <F10> :SrcExplToggle<CR>

"""""""""""""""""""""""""""""""
" pkg:: tags
"""""""""""""""""""""""""""""""
set tags=./tags;
"set autochdir
"""""""""""""""""""""""""""""""
" pkg:: ctrlp.vim
"""""""""""""""""""""""""""""""
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" The Silver Searcher
" (for faster grepping)
" macOS:
"    brew install the_silver_searcher
" Linux: Ubuntu >= 13.10 (Saucy) or Debian >= 8 (Jessie)
"    apt-get install silversearcher-ag"
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"""""""""""""""""""""""""""""""
" pkg:: snipmate
"""""""""""""""""""""""""""""""
let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,rails'
let g:snipMate = { 'snippet_version' : 1 }

"""""""""""""""""""""""""""""""
" pkg:: TagBar
"""""""""""""""""""""""""""""""
"nmap <F2> :TagbarToggle<CR>
" let g:tagbar_compact = 1



"""""""""""""""""""""""""""""""
" pkg:: cscope
"""""""""""""""""""""""""""""""
function! Create_cscope_file(execfile)
    exe "! bash" a:execfile a:execfile
endfunction

function! Create_cscope_out(cscope_files)
    exe "! cscope -bRq -i" a:cscope_files
endfunction

if has("cscope")
    let cscope_exec=findfile("cscope.sh", ".;")
    if !empty(cscope_exec)
        if cscope_exec ==? "cscope.sh"
            set csre
        endif
        silent call Create_cscope_file(cscope_exec)
        let cscope_files=findfile("cscope.files", ".;")
        if !empty(cscope_files) && filereadable(cscope_files)
            silent call Create_cscope_out(cscope_files)
            let cscope_out=findfile("cscope.out", ".;")
            if !empty(cscope_out) && filereadable(cscope_out)
                silent exe "cs add" cscope_out
            endif
        endif
    endif
endif

noremap <leader>cs :cs find s
noremap zs :cs find s <C-R>=expand("<cword>")<CR><CR>
noremap zg :cs find g <C-R>=expand("<cword>")<CR><CR>
noremap zc :cs find c <C-R>=expand("<cword>")<CR><CR>
noremap zd :cs find d <C-R>=expand("<cword>")<CR><CR>
noremap zt :cs find t <C-R>=expand("<cword>")<CR><CR>
noremap ze :cs find e <C-R>=expand("<cword>")<CR><CR>
noremap zf :cs find f <C-R>=expand("<cfile>")<CR><CR>
noremap zi :cs find i <C-R>=expand("<cfile>")<CR><CR>



"""""""""""""""""""""""""""""""
" Function
"""""""""""""""""""""""""""""""
" a little more informative version of the above
nmap <Leader>sI :call <SID>SynStack()<CR>

function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
