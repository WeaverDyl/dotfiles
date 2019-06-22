let mapleader = ','

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
set number
set termguicolors
colorscheme onedark
set tabstop=4
set shiftwidth=4
set laststatus=2
set guioptions-=m
set guioptions-=T
set guicursor=			" fix block cursor neovim
set clipboard=unnamedplus     	" yank to system clipboard too
set nocompatible              	" be iMproved, required
filetype off                  	" required

let g:airline_powerline_fonts = 1

" Nerd tree
let NERDTreeShowHidden=1 " shows hidden files
autocmd FileType nerdtree nmap <buffer> <left> u
autocmd FileType nerdtree nmap <buffer> <right> <cr> 
let NERDTreeMapOpenInTab='<C-a>' " remap t to ctrl-a
nmap <C-z> :NERDTreeTabsToggle<cr>

" Swap lines
:nnoremap <C-Up> <Up>"add"ap<Up>
:nnoremap <C-Down> "add"ap

" Tab mappings
noremap <C-c> :tabnext<cr>
noremap! <C-c> :tabnext<cr>
noremap <C-x> :tabprevious<cr>
noremap! <C-x> :tabprevious<cr>

" Update programs when their configs are changed
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

