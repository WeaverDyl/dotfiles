let mapleader = ','

" Basic settings
filetype plugin indent on
set relativenumber
colorscheme onedark
set termguicolors
set tabstop=4
set shiftwidth=4
set laststatus=2
set guicursor=					" fix block cursor neovim
set clipboard=unnamedplus     	" yank to system clipboard too
set nocompatible              	" be iMproved, required
syntax on
filetype plugin indent on

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'w0rp/ale'
call vundle#end()

" Plugin Settings
let g:airline_powerline_fonts = 1
let g:NERDTreeIndicatorMapCustom = {
	\ "Modified"	:	""
	\ }
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" Nerd tree
let NERDTreeShowHidden=1 " shows hidden files
autocmd FileType nerdtree nmap <buffer> <left> u
autocmd FileType nerdtree nmap <buffer> <right> <cr>
let NERDTreeMapOpenInTab='<C-z>' " remap t to ctrl-a
noremap <C-a> :NERDTreeTabsToggle<cr>
noremap! <C-a> :NERDTreeTabsToggle<cr>

" General mappings
" Swap lines
nnoremap <C-Down> "add"ap
nnoremap <C-Up> <Up>"add"ap<Up>

" Tab mappings
noremap <C-c> :tabnext<cr>
noremap! <C-c> :tabnext<cr>
noremap <C-x> :tabprevious<cr>
noremap! <C-x> :tabprevious<cr>

" Update programs when their configs are changed
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
autocmd BufWritePost *Xresources,*Xdefaults silent !xrdb %
autocmd BufWritePost */i3/config silent !i3-msg reload

" remove trailing spaces
autocmd BufWritePre * %s/\s\+$//e
