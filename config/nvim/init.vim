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
set foldmethod=marker
set clipboard+=unnamedplus     	" yank to system clipboard too
set nocompatible              	" be iMproved, required
set autoindent
syntax on
filetype plugin indent on

" nvim
set inccommand=nosplit

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
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'
Plugin 'w0rp/ale'
Plugin 'alvan/vim-closetag'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'arp242/undofile_warn.vim'
Plugin 'tpope/vim-commentary'
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

" undofile_warn
let g:undofile_warn_mode = 2

" Nerd tree
let NERDTreeShowHidden=1 " shows hidden files
autocmd FileType nerdtree nmap <buffer> <left> u
autocmd FileType nerdtree nmap <buffer> <right> <cr>
map <C-z> <Nop>
let NERDTreeMapOpenInTab='<C-z>' " remap t to ctrl-z

noremap <C-a> :call NerdTreeToggleFind()<cr>
noremap! <expr> <C-a> :<Esc> NerdTreeToggleFind()<cr>

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" General mappings
" Swap lines
nnoremap <C-Down> "add"ap
nnoremap <C-Up> <Up>"add"ap<Up>

" Wrap mappings
noremap <Up> gk
noremap <Down> gj

noremap j gj
noremap k gk

" Tab mappings
noremap <C-c> :tabnext<cr>
noremap! <C-c> <Esc>:tabnext<cr>
noremap <C-x> :tabprevious<cr>
noremap! <C-x> <Esc>:tabprevious<cr>

" Buffer mappings
function! NerdTreeToggleFind()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        NERDTreeClose
    elseif filereadable(expand('%'))
        NERDTreeFind
    else
        NERDTree
    endif
endfunction

function! Buffer_Delete()
	if exists("g:NERDTree") && g:NERDTree.IsOpen()
		NERDTreeToggle %
		bd
		NERDTreeToggle
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
