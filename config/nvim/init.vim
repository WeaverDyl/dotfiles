syntax enable
set number
set termguicolors
colorscheme onedark
set laststatus=2
set guioptions-=m
set guioptions-=T
set guicursor=			" fix block cursor neovim
set clipboard=unnamedplus     	" yank to system clipboard too
set nocompatible              	" be iMproved, required
filetype off                  	" required

" Copy/paste (neovim)
vnoremap <C-c> "+y
map <C-p> "+P

" Tab mappings
noremap <C-x> <C-\><C-N>:tabnext<cr>
noremap! <C-x> <C-\><C-N>:tabnext<cr>
noremap <C-z> <C-\><C-N>:tabprevious<cr>
noremap! <C-z> <C-\><C-N>:tabprevious<cr>

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/nerdtree'
call vundle#end()            " required
filetype plugin indent on    " required

let g:airline_powerline_fonts = 1
