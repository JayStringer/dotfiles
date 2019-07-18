" Plug ins

call plug#begin("~/.local/share/nvim/plugged")
Plug 'christoomey/vim-tmux-navigator'   " Navigate between Tmux and Neovim Easily
Plug 'scrooloose/nerdtree'              " File navigation
Plug 'ntk148v/vim-horizon'              " Horizon Theme (Inspired by VSCode Theme)
Plug 'itchyny/lightline.vim'            " Lightweight status bar
Plug 'tpope/vim-fugitive'               " Git Integration
Plug 'w0rp/ale'                         " Syntax Checking
Plug 'junegunn/rainbow_parentheses.vim' " Rainbow parenthesis

" Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'} " Async autocompletion
" Plug 'Shougo/context_filetype.vim'                          " Completion from other opened files
" Plug 'zchee/deoplete-jedi', {'do': ':UpdateRemotePlugins'}  " Python autocompletion
" Plug 'davidhalter/jedi-vim'                                 " Other features

" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile' }

Plug 'zxqfl/tabnine-vim' " ML driven autocomplete

Plug 'Townk/vim-autoclose'                                      " Autoclose parenthesis
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'} " Fuzzy find everything
Plug 'junegunn/fzf.vim'

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
"set bg=dark
syntax on
colorscheme onehalfdark

" Rainbow brackets
au VimEnter * RainbowParentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']']] 

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

" No line wrapping
set nowrap

" Clear search results
nnoremap <silent> // :noh<CR>

" Map ctrl+UP/DOWN for previous/next lint error
nmap <silent> <C-UP> <Plug>(ale_previous_wrap)
nmap <silent> <C-DOWN> <Plug>(ale_next_wrap)

" Required for the first option to be selected in autocomplete
" set completeopt+=noinsert

set ttimeoutlen=5

" ============================================================================
"                              Plugin Configuration
" ============================================================================

" NERDTree
" =========================================================

" Toggle NERDTree with F3
map <F3> : NERDTreeToggle<CR>
" Open nerd tree with current file selected
nmap ,t :NERDTreeFind <CR>
" Don't show thses file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']


" LightLine
" =========================================================

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


" Deoplete
" =========================================================

" Use deoplete
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_ignore_case = 1
" let g:deoplete#enable_smart_case = 1
" " Complete with words from any opened file
" let g:context_filetype#same_filetypes = {}
" let g:context_filetype#same_filetypes._ = '_'


" Jedi-vim
" =========================================================

" Disable autocompletion (using deoplete instead)
" let g:jedi#completions_enabled = 0
" 
" " All these mappings work only for python code:
" " Go to definition
" let g:jedi#goto_command = ',d'
" " Find ocurrences
" let g:jedi#usages_command = ',o'
" " Find assignments
" let g:jedi#goto_assignments_command = ',a'
" " Go to definition in new tab
" nmap ,D :tab split<CR>:call jedi#goto()<CR>


" Fzf
" =========================================================

" File finder mapping
nmap ,e :Files<CR>
" Tags (symbols) in current file finder mapping
nmap ,g :BTag<CR>
" Tags (symbols) in all files finder mapping
nmap ,G :Tags<CR>
" General code finder in current file mapping
nmap ,f :BLines<CR>
" General code finder in all files mapping
nmap ,F :Lines<CR>
" Commands finder mapping
nmap ,c :Commands<CR>


" COC.NVIM
" =========================================================

" let g:coc_force_debug = 1
" 
" " if hidden is not set, TextEdit might fail.
" set hidden
" 
" " Some servers have issues with backup files, see #649
" set nobackup
" set nowritebackup
" 
" " Better display for messages
" set cmdheight=2
" 
" " Smaller updatetime for CursorHold & CursorHoldI
" set updatetime=300
" 
" " don't give |ins-completion-menu| messages.
" set shortmess+=c
" 
" " always show signcolumns
" set signcolumn=yes
" 
" " Use tab for trigger completion with characters ahead and navigate.
" " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" 
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
" 
" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()
" 
" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" " Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" 
" " Use `[c` and `]c` to navigate diagnostics
" nmap <silent> [c <Plug>(coc-diagnostic-prev)
" nmap <silent> ]c <Plug>(coc-diagnostic-next)
" 
" " Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" 
" " Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>
" 
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction
" 
" " Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')
" 
" " Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)
" 
" " Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
" 
" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end
" 
" " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
" 
" " Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)
" 
" " Use `:Format` to format current buffer
" command! -nargs=0 Format :call CocAction('format')
" 
" " Use `:Fold` to fold current buffer
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" 
" " use `:OR` for organize import of current buffer
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" 
" " Add diagnostic info for https://github.com/itchyny/lightline.vim
" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified'] ]
"       \ },
"       \ 'component_function': {
"       \   'cocstatus': 'coc#status',
"       \   'gitbranch': 'fugitive#head'
"       \ },
"       \ }
" 
" 
" 
" " Using CocList
" " Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
