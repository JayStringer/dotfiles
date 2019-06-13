" Plug ins
"
call plug#begin("~/.local/share/nvim/plugged")
Plug 'christoomey/vim-tmux-navigator'  " Navigate between Tmux and Neovim Easily
Plug 'scrooloose/nerdtree'             " File navigation
Plug 'ntk148v/vim-horizon'             " Horizon Theme (Inspired by VSCode Theme)
Plug 'itchyny/lightline.vim'           " Lightweight status bar
Plug 'tpope/vim-fugitive'              " Git Integration

call plug#end()


" Make ctrl-c copy to clipboard
map <C-c> "+y<CR>
map <C-p> "+P<CR>

" Map ctrl-s to save in each mode
noremap <silent> <C-s> :update<CR>
vnoremap <silent> <C-s> <C-C>:update<CR>
inoremap <silent> <C-s> <C-O>:update<CR>

" Appearance
set number relativenumber " show line numbers
set termguicolors
colorscheme onehalfdark 

" Tab formatting
filetype plugin indent on
set tabstop=4     " Show tabs as 4 spaces width
set shiftwidth=4  " When tab is pressed, use 4 spaces
set expandtab     " Change tab characters to spaces

" Scroll viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-q> 3<C-y>
" Allow viewport scrolling in insert modud
inoremap <C-e> <C-o>3<C-e>
inoremap <C-q> <C-o>3<C-q>
" When scrolling, keep 3 cursorline away from screen border
set scrolloff=3

" Sane splitting
set splitbelow splitright

" Clear search results
nnoremap <silent> // :noh<CR>


" Plugin Configuration

" NERDTree-------------------------------------------
" Toggle NERDTree with F3
map <F3> : NERDTreeToggle<CR>
" Open nerd tree with current file selected
nmap ,t :NERDTreeFind <CR>
" Don't show thses file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" LightLine -----------------------------------------
" Configure lightline, also use stuff from fugitive
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
