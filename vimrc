"
" Nelson Lim's vimrc settings
"

" automatically resource my .vimrc
autocmd! bufwritepost .vimrc source %

" better copy and paste
set pastetoggle=<F2>
" lets you copy and paste from vim to other apps
set clipboard=unnamed

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" Disable swap files and backups
set nobackup
set nowritebackup
set noswapfile

" Remap the <Leader> key from \ to ,
let mapleader = ","

" removes high lighting of last search
noremap <Leader>/ :nohl<cr>

" map window navigate keys
" use Ctrl+<movement> keys to move ard windows instead of Ctrl+w+<movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easy movement between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" better block indentation without losing selection
vnoremap < <gv
vnoremap > >gv

" function to remove trailing white spaces
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" removes trailing whitespaces on python files
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

" automatically strip trailing whitespaces when saving .py and .js files
autocmd BufWritePre *.py,*.js :call <SID>StripTrailingWhitespaces()

" toggle show/hide invisible characters
nmap <Leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" width of document (useed by gd)
set tw=79

" don't wrap on load
set nowrap

"  don't wrap text when typing
set fo-=t
" needs vim 7.3 and above
"set colorcolumn=80
"highlight ColorColumn ctermbg=233

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" sets auto indent for python and text with to 78
" pep 8 comptabile
au FileType python set autoindent
au FileType python set smartindent
au FileType python set textwidth=78

" easier to organise code and hide portions I'm not interested in
set foldmethod=indent
set foldlevel=99

" useful settingsd
set history=700
set undolevels=700

" real programmers use spaces not tabs
set tabstop =4 "tabs should take 4 spaces
set softtabstop=4
set shiftwidth=4 "controls depth of indentation
set shiftround
set expandtab "expand tabs to spaces

let g:pep8_map='<leader>8'

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
    " do not keep a backup file, use versions instead
    set nobackup
else
    " keep a backup file
    set backup
endif

" keep 50 lines of command line history
set history=50

" show the cursor position all the time
set ruler

" display incomplete commands
set showcmd


" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()
call pathogen#helptags()

" ============================================================================
" Python IDE Setup
" ============================================================================

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" Settings for python-mode (needs python 2.6 and above)
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable

" Settings for ctrlpi
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
"" set wildignore+=*.pyc
"" set wildignore+=*_build/*
"" set wildignore+=*/coverage/*
