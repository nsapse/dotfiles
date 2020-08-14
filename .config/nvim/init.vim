"Just Setting Defaults"

syntax on

" vim paramaters 
set nu
set rnu 
set tabstop=4 softtabstop=4
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir'
set undofile

set cmdheight=2


" Leader set to <Space>"

let mapleader = " "

"Remapping Default Commands to Leader
nnoremap<silent><leader>s :wincmd v<cr>
nnoremap<silent><leader>S :wincmd s<cr>
nnoremap<silent><leader>c :wincmd c<cr>
nnoremap<silent><leader>h :wincmd h<cr>
nnoremap<silent><leader>j :wincmd j<cr>
nnoremap<silent><leader>k :wincmd k<cr>
nnoremap<silent><leader>l :wincmd l<cr>
nnoremap<silent><leader>t :wincmd t<cr>

nnoremap<silent><leader>ig :IndentGuidesToggle<cr>
map <leader><leader>n :nohlsearch<cr>

nnoremap<silent><c-L> :vertical resize +5<cr>
nnoremap<silent><c-H> :vertical resize -5<cr>
nnoremap<silent><c-K> :resize -5<cr>
nnoremap<silent><c-J> :resize +5<cr>

"buffer navigation
"
nnoremap <silent> b] :bnext<cr>
nnoremap <silent> b[ :bprevious<cr>
nnoremap <silent> B] :bfirst<cr>
nnoremap <silent> B[ :blast<cr>

"Traditional Save and Quit Bindings
map <c-s> :w<cr>
map <c-q> :q<cr>

"Plugged Additions"

call plug#begin()

Plug 'aswathkk/darkscene.vim'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'heavenshell/vim-pydocstring'
Plug 'honza/vim-snippets'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'morhetz/gruvbox'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'raimondi/delimitmate'
Plug 'ryanoasis/vim-devicons'
Plug 'sainnhe/gruvbox-material'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot' 
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-utils/vim-man'
Plug 'yggdroot/indentline'
Plug 'flazz/vim-colorschemes'
Plug 'chiel92/vim-autoformat'

call plug#end()

colorscheme gruvbox-material

"Remappings for CoC
" <TAB> - trigger completion, pum navigate, snippet expand and jump
" like VSCode inoremap <silent><expr> <TAB>"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
		inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
 
function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<c-j>' 
let g:coc_snippet_prev = '<c-k>'

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm. " <cr>
" could be remapped by other vim plugin, try `:verbose imap <CR>`."

if exists('*complete_info')   
 inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else   
 inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>" 
endif

"additional Coc remappings for plugsin
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>rr <Plug>(coc-rename)

"mappings for Coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)

"remapping for NERDTree
map <C-n> :NERDTreeToggle<CR>

" Remappings for vim-easymotion
" <Leader>f{char} to move to {char} 
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

"Remapping for Undotree"
nmap <C-u> :UndotreeToggle<cr>

" NerdCommenter Remap to Match VSCode, Etc.
nmap <C-_> <Leader>c<Space>
vmap <C-_> <Leader>c<Space>

"ctrl-p launches FZF
nnoremap <c-p> :FZF<cr>

"Tagbar Settings
nnoremap <Leader>T :TagbarToggle<cr>

"vim-airline settings

"enable smarter tab line
let g:airline#extensions#tabline#enabled = 1

"Automated Docstrings for Python
nnoremap<silent><leader>? <Plug>(pydocstring)
