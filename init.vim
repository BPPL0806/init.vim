" Enable syntax highlighting
syntax enable

" Set relative line numbers
set number relativenumber

set encoding=UTF-8

" Configure NERDTree
" Open NERDTree automatically when vim starts if it's the only file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | NERDTree | wincmd p | endif

" Plugin manager: Vim-Plug
" Install Vim-Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs' 
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

" Set gruvbox colorscheme
colorscheme gruvbox

" Enable NERDTree icons
let g:NERDTreeGitStatusIndicatorMapCustom = {
  \ "nerdtree-git-plugin": {
  \   "Unstaged": "",
  \   "Staged": "✓",
  \   "Unmerged": "",
  \   "Renamed": "➜",
  \   "Untracked": "★",
  \   "Deleted": "",
  \   "Dirty": "",
  \   "Clean": "",
  \   "Ignored": ""
  \ }
\ }

" Configure autopairs
let g:autopairs_start_ignore = '^\s*$'   " Ignore empty lines
let g:autopairs_filetype_blacklist = ['nerdtree']  " Don't enable autopairs in NERDTree

" Use KDE clipboard provider
if has('clipboard')
    if has('unnamedplus')
        set clipboard^=unnamedplus
    endif
endif


" Map <S-p> to paste from system clipboard
nnoremap <silent> <S-p> "+p
vnoremap <silent> <S-p> "+p

" Map <S-tab> to toggle NERDTree
nmap <silent> <S-tab> :NERDTreeToggle<CR>
