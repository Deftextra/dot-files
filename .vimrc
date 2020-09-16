
" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')
"------- All accidently deleted plugins --------------

" NERDTree
" YouCompleteMe
" auto-pairs
" fzf.vim
" goyo.vim
" indentLine
" markdown-preview.nvim
" nerdcommenter
" rainbow
" tmuxline.vim
" vim-airline
" vim-airline-themes
" vim-fugitive
" vim-gitgutter
" vim-repeat
" vim-surround
" vim-tmux-navigator
"  vimux
" ---------------------------------------

"------- Review plugins --------------
" lambdalisue/fern.vim - Alternative to NERDTree
"-------------------------------------

" Colors and themes
Plug 'chuling/equinusocio-material.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'edkolev/tmuxline.vim'

" Integrate fzf with Vim.
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
                        
" Seamlessly navigate between tmux and vim windows
Plug 'christoomey/vim-tmux-navigator'

" Pass focus events from tmux to Vim (useful for autoread and linting tools).
Plug 'tmux-plugins/vim-tmux-focus-events'

" Show matching parenthesis in different color for better reading.
Plug 'luochen1990/rainbow'

" Automatically clear search highlights after you move your cursor.
Plug 'haya14busa/is.vim'

" Automatically set 'shiftwidth' + 'expandtab' (indention) based on file type.
Plug 'tpope/vim-sleuth'

" Toggle comments in various ways.
Plug 'tpope/vim-commentary'

" Easily surround text with required characters
Plug 'tpope/vim-surround'

" Automatically show Vim's complete menu while typing.
Plug 'vim-scripts/AutoComplPop'

" Highlight which character to jump to when using horizontal movement keys.
Plug 'unblevable/quick-scope'

" Code language, syntax, filetype and autocompletion 
Plug  'ycm-core/YouCompleteMe'

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
let g:equinusocio_material_style = 'darker'
colorscheme equinusocio_material


" -----------------------------------------------------------------------------
" Status line
" -----------------------------------------------------------------------------

" Heavily inspired by: https://github.com/junegunn/dotfiles/blob/master/vimrc
function! s:statusline_expr()
  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let ro  = "%{&readonly ? '[RO] ' : ''}"
  let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let sep = ' %= '
  let pos = ' %-12(%l : %c%V%) '
  let pct = ' %P'

  return '[%n] %f %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
endfunction

let &statusline = s:statusline_expr()

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
set modelines=2
set mouse=a
set nocompatible
set noerrorbells visualbell t_vb=
set noshiftround
set nospell
set nostartofline
set number relativenumber
set regexpengine=1
set scrolloff=3
set shiftwidth=4
set showcmd
set showmatch
set shortmess+=c
set showmode
set smartcase       
set softtabstop=2
set splitbelow
set splitright
set tabstop=4
set textwidth=0
set ttimeout
set ttyfast
set ttymouse=sgr
set undodir=/tmp
set undofile
set virtualedit=block
set wildmenu
set wildmode=full
set wrap
set formatoptions-=cro

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

" Navigate the complete menu items like CTRL+n / CTRL+p would.
inoremap <expr> <C-j> pumvisible() ? "<C-n>" :"<C-j>"
inoremap <expr> <C-k> pumvisible() ? "<C-p>" : "<C-k>"

" Select the complete menu item like CTRL+y would.
inoremap <expr> <C-l> pumvisible() ? "<C-y>" : "<C-l>"
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"

" Cancel the complete menu item like CTRL+e would.
inoremap <expr> <down> pumvisible() ? "<C-e>" : "<down>

" Prevent x from overriding what's in the clipboard.
noremap x "_x
noremap X "_x

" .............................................................................
" Autoclose mappings
" Inspired by : 
" https://medium.com/vim-drops/custom-autoclose-mappings-1ff90f45c6f5
" .............................................................................

"autoclose and position cursor to write text inside
inoremap ' ''<left> inoremap ` ``<left>
inoremap " ""<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
"autoclose with ; and position cursor to write text inside
inoremap '; '';<left><left>
inoremap `; ``;<left><left>
inoremap "; "";<left><left>
inoremap (; ();<left><left>
inoremap [; [];<left><left>
inoremap {; {};<left><left>
"autoclose with , and position cursor to write text inside
inoremap ', '',<left><left>
inoremap `, ``,<left><left>
inoremap ", "",<left><left>
inoremap (, (),<left><left>
inoremap [, [],<left><left>
inoremap {, {},<left><left>
"autoclose and position cursor after
inoremap '<space> ''
inoremap `<space> ``
inoremap "<space> ""
inoremap (<space> ()
inoremap [<space> []
inoremap {<space> {}
"autoclose with ; and position cursor after
inoremap ';<space> '';
inoremap `;<space> ``;
inoremap ";<space> "";
inoremap (;<space> ();
inoremap [;<space> [];
inoremap {;<space> {};
"autoclose with , and position cursor after
inoremap ',<space> '',
inoremap `,<space> ``,
inoremap ",<space> "",
inoremap (,<space> (),
inoremap [,<space> [],
inoremap {,<space> {},
"autoclose 2 lines below and position cursor in the middle 
inoremap '<CR> '<CR>'<ESC>O
inoremap `<CR> `<CR>`<ESC>O
inoremap "<CR> "<CR>"<ESC>O
inoremap (<CR> (<CR>)<ESC>O
inoremap [<CR> [<CR>]<ESC>O
inoremap {<CR> {<CR>}<ESC>O
"autoclose 2 lines below adding ; and position cursor in the middle 
inoremap ';<CR> '<CR>';<ESC>O
inoremap `;<CR> `<CR>`;<ESC>O
inoremap ";<CR> "<CR>";<ESC>O
inoremap (;<CR> (<CR>);<ESC>O
inoremap [;<CR> [<CR>];<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
"autoclose 2 lines below adding , and position cursor in the middle 
inoremap ',<CR> '<CR>',<ESC>O
inoremap `,<CR> `<CR>`,<ESC>O
inoremap ",<CR> "<CR>",<ESC>O
inoremap (,<CR> (<CR>),<ESC>O
inoremap [,<CR> [<CR>],<ESC>O
inoremap {,<CR> {<CR>},<ESC>O



" -----------------------------------------------------------------------------
" Basic autocommands
" -----------------------------------------------------------------------------
" Set cursorline when in insert mode.
autocmd InsertEnter,InsertLeave * set cul!

" Update a buffer's contents on focus if it changed outside of Vim.
au FocusGained,BufEnter * :checktime


" -----------------------------------------------------------------------------
" Plugin settings, mappings and autocommands
" -----------------------------------------------------------------------------

" .............................................................................
" unblevable/quick-scope
" .............................................................................
" Trigger a highlight in the appropriate direction when pressing these keys:

" Un Comment if you want to Trigger highlighting only on key press.
" let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Only underline the highlights instead of using custom colors.
highlight QuickScopePrimary gui=underline cterm=underline
highlight QuickScopeSecondary gui=underline cterm=underline

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
if isdirectory(".git")
    nnoremap <silent>  <C-p> :GFiles<CR>
else
    nnoremap <silent> <C-p> :FZF -m<CR>
endif

" .............................................................................
" ycm-core/YouCompleteMe
" .............................................................................

" Default compelation flags if none are found
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'

fun! GoYCM()
  nnoremap <buffer> <silent> <leader>gd :YcmCompleter GoTo<CR>
  nnoremap <buffer> <silent> <leader>gr :YcmCompleter GoToReferences<CR>
  nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorRename<space>
endfun

autocmd FileType cpp,cxx,h,hpp,c :call GoYCM()

" .............................................................................
" luochen1990/rainbow
" .............................................................................

" By default is active
 let g:rainbow_active = 1

" Toggle on and off
nnoremap <leader>rt :RainbowToggle<CR>

" .............................................................................
" vim-airline/vim-airline 
" .............................................................................
let g:airline_theme = 'equinusocio_material'
