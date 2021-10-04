let g:ackprg = 'ag --nogroup --nocolor --column'

set number
set mouse=a
set ai
set hlsearch
set ruler
set cursorline
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set autoindent
set smartindent
set nocompatible
set encoding=utf-8
syntax on

let g:airline_powerline_fonts = 1
" == VIM PLUG ================================
call plug#begin('~/.vim/plugged')
"------------------------ COC ------------------------
Plug 'caenrique/nvim-toggle-terminal'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
"Plug 'tsony-tsonev/nerdtree-git-plugin'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'scrooloose/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'dikiaap/minimalist'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'jiangmiao/auto-pairs'
Plug 'miyakogi/seiya.vim'
Plug 'dracula/vim'
call plug#end()

set termguicolors

let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

autocmd FileType * RainbowParentheses

au BufNewFile,BufRead *.ts setlocal filetype=typescript
  au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

let g:airline_theme='minimalist'
let g:seiya_auto_enable=1

colorscheme dracula

augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver25
augroup END

map q :quit<CR>
map <C-s> :write<CR>

let g:airline_powerline_fonts = 1

set encoding=UTF-8
set guifont=DroidSansMono\ Nerd\ Font\ 11

if has('termguicolors') && $TERM_PROGRAM ==# 'Alacritty'
  set t_8f=^[[38;2;%lu;%lu;%lum
  set t_8b=^[[48;2;%lu;%lu;%lum
  set termguicolors
endif

hi! NonText ctermbg=NONE guibg=NONE
hi! Normal ctermbg=NONE guibg=NONE
set notermguicolors
set termguicolors

nnoremap <silent> <C-t> :ToggleTerminal<Enter>
tnoremap <silent> <C-t> <C-\><C-n>:ToggleTerminal<Enter>

