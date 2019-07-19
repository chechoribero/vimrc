" Plugins {{{
if empty(glob('~/.vim/autoload/plug.vim')) || empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugs')
" Make sure you use single quotes

" Plug 'dag/vim-fish'         " Vim-fish for syntax highlighting
Plug 'mattn/emmet-vim'      " Emmet
Plug 'ayu-theme/ayu-vim'    " Ayu theme
Plug 'jiangmiao/auto-pairs' " Enable automatic pairs closing
Plug 'tomtom/tcomment_vim'  " Comment out lines and blocks of code
Plug 'tpope/vim-surround'   " Surround tags and quotes
Plug 'pangloss/vim-javascript' " JavaScript syntax highlighting
Plug 'sbdchd/neoformat'     " Just makes things prettier
Plug 'othree/xml.vim'       " XML/HTML editing
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/goyo.vim'    " Goyo for writing
" Plug 'tpope/vim-vinegar'    " Tree-like view for netrw
" Plug 'jceb/vim-orgmode'     " Org-mode functionality
" Plug 'tpope/vim-speeddating' " Required by Org-mode
Plug 'davidoc/taskpaper.vim' " TaskPaper support
Plug 'posva/vim-vue'         " Vue syntax highlighting
Plug 'scrooloose/nerdtree'   " Tree file explorer

" Add plugins to &runtimepath
" Remember to install new plugins by running :PlugInstall and :PlugUpdate to
" update
call plug#end()
" }}}
" Colors {{{
syntax enable               " Enable syntax
set termguicolors           " Enable true colors
let ayucolor="dark"         " Set Ayu color
colorscheme ayu             " Use Ayu color scheme

" Set the font color
hi Normal guifg=#BFBAB0 gui=NONE

" JS syntax highlighting
syn match jsFuncCall /\k\+\%(\s*(\)\@=/
hi link jsFuncCall Function

" Tab colors
hi TabLineFill guifg=#5C6773 guibg=#14191F gui=NONE
hi TabLine guifg=#5C6773 guibg=#14191F gui=NONE
hi TabLineSel guifg=#FFFFFF guibg=#272D38 gui=NONE

" TaskPaper colors
" hi link taskpaperDone Comment
" hi link taskpaperCancelled Comment
" }}}
" Spaces & Tabs {{{
set tabstop=4               " Width of file tab
set softtabstop=4           " Width of tab in editor
set shiftwidth=4            " Shift width
set expandtab             " Set tabs as spaces
" }}}
" Editor {{{
set nowrap                  " Disable line wrapping
set number                  " Show line numbers
set cursorline              " Highlight current line
set wildmenu                " Show menu for directory autocompletion
filetype plugin indent on
set clipboard=unnamed       " Use system clipboard
" }}}
" Netrw {{{
" let g:netrw_winsize = 15
" let g:netrw_browse_split = 4
" }}}
" Emmet {{{
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss,vue  EmmetInstall
autocmd FileType html,css,scss,vue imap <buffer> <tab> <plug>(emmet-expand-abbr)
" }}}
" Terminal {{{
" tnoremap <Esc> <C-\><C-n>
" }}}
" Movement {{{
" Enable vertical movement in visual mode
nnoremap j gj
nnoremap k gk
" }}}
" Leader Shortcuts {{{
let mapleader="\<SPACE>"
let maplocalleader=","
nnoremap <SPACE> <nop>

nnoremap <leader>fe :tabnew ~/vimrc/.vimrc<CR>
nnoremap <leader>fR :source $MYVIMRC<CR>
nnoremap <leader>ff :FZF<CR>
nnoremap <leader>fn :tabnew<CR>
nnoremap <leader>tl zfat<CR>

" Split and move between windows
nnoremap <leader>wv <C-w>v
nnoremap <leader>ws <C-w>s
nnoremap <leader>wl <C-w>l
nnoremap <leader>wh <C-w>h
nnoremap <leader>wk <C-w>k
nnoremap <leader>wj <C-w>j

" Resize horizontal splits
nnoremap <leader>w+ <C-w>+
nnoremap <leader>w- <C-w>-

" Resize vertical splits
nnoremap <leader>w> <C-w>>
nnoremap <leader>w< <C-w><

" Netrw
" nnoremap <leader>ee :Explore<CR>
" nnoremap <leader>eh :Sex<CR>
" nnoremap <leader>ev :Vex<CR>

" NERDTree
nnoremap <leader>nt :NERDTreeToggle <CR>
nnoremap <leader>nf :NERDTreeFocus <CR>
nnoremap <leader>nd :NERDTreeCWD <CR>
" }}}
" Modelines {{{
    set modelines=1
" }}}
" vim:foldmethod=marker:foldlevel=0
