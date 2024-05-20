syntax enable
set number relativenumber
set encoding=UTF-8
set hidden
set tabstop=4
set shiftwidth=4
set expandtab

call plug#begin('~/.config/nvim/plugged')
Plug 'Exafunction/codeium.vim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'andweeb/presence.nvim'
Plug 'romgrk/barbar.nvim'
call plug#end()

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | NERDTree | wincmd p | endif

lua require("lualine").setup()
lua require("toggleterm").setup()
lua require('gitsigns').setup()
colorscheme gruvbox

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

let g:autopairs_start_ignore = '^\s*$'   " Ignore empty lines
let g:autopairs_filetype_blacklist = ['nerdtree']  " Don't enable autopairs in NERDTree

if has('clipboard')
    if has('unnamedplus')
        set clipboard^=unnamedplus
    endif
endif

nnoremap <silent> <S-p> "+p
vnoremap <silent> <S-p> "+p

nmap <silent> <S-tab> :NERDTreeToggle<CR>

nnoremap <silent> <M-t> :ToggleTerm <CR>
tnoremap <silent> <M-t> <C-\><C-n>:ToggleTerm<CR>

nnoremap <silent> <S-t> :tabnew<CR>
nnoremap <silent> <S-Right> :BufferNext<CR>
nnoremap <silent> <S-l> :BufferNext<CR>
nnoremap <silent> <S-k> :BufferNext<CR>
nnoremap <silent> <S-Left> :BufferPrevious<CR>
nnoremap <silent> <S-h> :BufferPrevious<CR>
nnoremap <silent> <S-j> :BufferPrevious<CR>
nnoremap <silent> <S-c> :BufferClose<CR>

nnoremap <silent> <A-m> codeium#CycleCompletions(1)<CR>
nnoremap <silent> <A-n> codeium#CycleCompletions(-1)<CR>
