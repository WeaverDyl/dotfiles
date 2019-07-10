let mapleader = ','

" Basic settings
set hidden
filetype plugin indent on
set relativenumber
colorscheme onedark
set termguicolors
set undofile
set tabstop=4
set shiftwidth=4
set laststatus=2
set guicursor=
set clipboard=unnamedplus     	" yank to system clipboard too
set nocompatible              	" be iMproved, required
set autoindent
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
Plugin 'alvan/vim-closetag'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'arp242/undofile_warn.vim'
call vundle#end()

" Plugin Settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_nr_type = 1
let g:airline#extensions#tabline#show_close_button = 0
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
map <C-z> <Nop>
let NERDTreeMapOpenInTab='<C-z>' " remap t to ctrl-z
noremap <C-a> :NERDTreeTabsToggle<cr>
noremap! <C-a> <Esc>:NERDTreeTabsToggle<cr>

" General mappings
" Swap lines
nnoremap <C-Down> "add"ap
nnoremap <C-Up> <Up>"add"ap<Up>

" Wrap mappings
" These 4 because I'm an arrow key peasant
noremap <Up> gk
noremap <Down> gj
noremap! <Up> gk
noremap! <Down> gj

noremap j gj
noremap k gk

" Tab mappings
noremap <C-c> :tabnext<cr>
noremap! <C-c> <Esc>:tabnext<cr>
noremap <C-x> :tabprevious<cr>
noremap! <C-x> <Esc>:tabprevious<cr>

" Buffer mappings
function! IsNerdTreeEnabled()
    return exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
endfunction

function! Buffer_Delete()
	if IsNerdTreeEnabled()
		NERDTreeTabsToggle
		bd
		NERDTreeTabsToggle
	else
		bd
	endif
endfunction

noremap <leader>q :call Buffer_Delete()<cr>
noremap <leader>n :bprevious<cr>
noremap <leader>m :bnext<cr>

" Update programs when their configs are changed
autocmd BufWritePost *sxhkdrc silent !pkill -USR1 sxhkd
autocmd BufWritePost *Xresources,*Xdefaults silent !xrdb %
autocmd BufWritePost */i3/config silent !i3-msg reload

" remove trailing spaces
autocmd BufWritePre * %s/\s\+$//e
