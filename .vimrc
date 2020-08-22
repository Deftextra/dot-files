
" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')
"------- All accidently deleted plugins --------------
"NERDTree
"YouCompleteMe
"auto-pairs
"fzf.vim
"goyo.vim
"indentLine
"markdown-preview.nvim
"nerdcommenter
"rainbow
"tmuxline.vim
"vim-airline
"vim-airline-themes
"vim-fugitive
"vim-gitgutter
"vim-repeat
"vim-surround
"vim-tmux-navigator
"vimux
"vimwiki
" ---------------------------------------

" Integrate fzf with Vim.
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
                        
" Seamlessly navigate between tmux and vim windows
Plug 'christoomey/vim-tmux-navigator'

" Pass focus events from tmux to Vim (useful for autoread and linting tools).
Plug 'tmux-plugins/vim-tmux-focus-events'

call plug#end()

" -----------------------------------------------------------------------------
" Color settings
" -----------------------------------------------------------------------------

" Enable 24-bit true colors if your terminal supports it.
if (has("termguicolors"))
  " https://github.com/vim/vim/issues/993#issuecomment-255651605
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Enable syntax highlighting.
syntax on

" Set color scheme.
set background=dark
colorscheme monokai

" -----------------------------------------------------------------------------
" Basic settings
"   Research any of these by running :help <setting>
" -----------------------------------------------------------------------------

let mapleader = ","
let maplocalleader = "\\"
inoremap kj <ESC>

set wildmenu
set number
set autoindent
set backspace=indent,eol,start
set backupdir=/tmp//,.
set clipboard=unnamedplus
set autoread
set colorcolumn=80
set complete+=kspell
set completeopt=menuone,longest
set cryptmethod=blowfish2
set directory=/tmp//,.
set encoding=utf-8
set expandtab smarttab
set formatoptions=tcqrn1
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set matchpairs+=<:> " Use % to jump between pairs
set mmp=5000
        
" -----------------------------------------------------------------------------
" Basic mappings
" -----------------------------------------------------------------------------

" Seamlessly treat visual lines as actual lines when moving around.
noremap j gj
noremap k gk
noremap <Down> gj
noremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk


" Write and quit buffer
nnoremap <leader>s :w<CR>
nnoremap <leader>q :q<CR> 

" Edit Vim config file in a new tab.
map <Leader>ev :tabnew $MYVIMRC<CR>

" Source Vim config file.
map <Leader>sv :source $MYVIMRC<CR>

iabbrev @@ rd.90@hotmail.com
iabbrev ccopy Copyright 2013 Radwan Suufi, all rights reserved.

" Clear search highlights.
noremap <leader><Space> :let @/=''<CR>

" Switch tabs 
nnoremap <S-h> :tabprevious<CR>
nnoremap <S-L> :tabnext<CR>


" -----------------------------------------------------------------------------
" Basic autocommands
" -----------------------------------------------------------------------------

" Set cursorline when in insert mode.
:autocmd InsertEnter,InsertLeave * set cul!

" -----------------------------------------------------------------------------
" Plugin settings, mappings and autocommands
" -----------------------------------------------------------------------------

" .............................................................................
" junegunn/fzf.vim
" .............................................................................
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

" Customize fzf colors to match your color scheme.
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}

" Launch fzf with CTRL+P.
nnoremap <silent> <C-p> :FZF -m<CR>
