" Map the leader key to SPACE
let mapleader = "\<space>"

"  NetEx file 
noremap <leader>pv :Ex<cr>
noremap <leader>v :vsplit<cr>

syntax on
filetype plugin indent on
set relativenumber
" Sane indenting
set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent


" Error bells fucking pain in the arse!
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
set cursorline
if exists('+colorcolumn')
  set colorcolumn=80
endif

" Easy manuvering in splits 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright
let g:netrw_altv = 1 " open window to the right 

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'neoclide/coc.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'sickill/vim-monokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'aserebryakov/vim-todo-lists'
call plug#end()

" use <tab> to trigger completion and navigate to the next comlete item 
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col-1] =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"Theme
set termguicolors
colorscheme monokai
