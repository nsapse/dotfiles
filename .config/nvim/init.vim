"Just Setting Defaults"

syntax on

" vim paramaters 
set nu
set rnu 
set termguicolors
set tabstop=4 softtabstop=4 expandtab
set shiftwidth=4
set smartindent
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set showmatch

"This is apparently necessary for Coc definition
set cmdheight=2
set hidden
set shortmess=aFc

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
map <silent><leader><leader>n :nohlsearch<cr>

nnoremap<silent><c-L> :vertical resize +5<cr>
nnoremap<silent><c-H> :vertical resize -5<cr>
nnoremap<silent><c-K> :resize -5<cr>
nnoremap<silent><c-J> :resize +5<cr>


"buffer and tab navigation
"
nnoremap <silent> b] :bnext<cr>
nnoremap <silent> b[ :bprevious<cr>
nnoremap <silent> B[ :bfirst<cr>
nnoremap <silent> B] :blast<cr>

nnoremap <silent> t] :tabnext<cr>
nnoremap <silent> t[ :tabprevious<cr>
nnoremap <silent> T[ :tabfirst<cr>
nnoremap <silent> T] :tablast<cr>

nnoremap <leader>R :reg<cr>
"Traditional (Non-Vim) Save and Quit Bindings
map <c-s> :w<cr>
map <c-q> :q<cr>


map <leader><c-s> :so %<CR> 

"Plugged Additions"

call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'aswathkk/darkscene.vim'
Plug 'chiel92/vim-autoformat'
Plug 'easymotion/vim-easymotion'
Plug 'elzr/vim-json'
Plug 'flazz/vim-colorschemes'
Plug 'heavenshell/vim-pydocstring'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf'
Plug 'junegunn/vim-easy-align'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'morhetz/gruvbox'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'othree/html5.vim'
Plug 'puremourning/vimspector'
Plug 'raimondi/delimitmate'
Plug 'ryanoasis/vim-devicons'
Plug 'sainnhe/gruvbox-material'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot' 
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-utils/vim-man'
Plug 'voldikss/vim-floaterm'
Plug 'pangloss/vim-javascript'
Plug 'makerj/vim-pdf)'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

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
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

"mappings for Coc-actions
"
" emap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

"remapping for NERDTree
map <silent><C-n> :NERDTreeToggle<CR>

" Remappings for vim-easymotion
" <Leader>f{char} to move to {char} 
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"Remapping for Undotree"
nmap <leader>U :UndotreeToggle<cr>

" NerdCommenter Remap to Match VSCode, Etc.
nmap <C-_> <Leader>c<Space>
vmap <C-_> <Leader>c<Space>

"ctrl-p launches FZF
"nnoremap <c-p> :FZF<cr>

"Tagbar Settings
nnoremap<c-t> :TagbarToggle<cr>

"vim-airline settings

"enable smarter tab line
let g:airline#extensions#tabline#enabled = 1

"Automated Docstrings for Python
nnoremap<silent><leader>? <Plug>(pydocstring)

"FloatTerm Bindings and Settings
nnoremap <silent> <leader>FL :FloatermToggle<CR>
tnoremap <silent> <leader>FL <C-\><C-n>:FloatermToggle<CR>
nnoremap <silent> <c-p>      :FloatermNew fzf<cr>
nnoremap <silent> <c-b>      :FloatermNew ranger<cr>
nnoremap <silent> <c-g>      :FloatermNew lazygit<cr>
let      g:floaterm_autoclose=1
let      g:floaterm_gitcommit='vsplit'

"Vim autoformat binding

nnoremap <leader>FF :Autoformat<cr>

"EasyAlign Bindings

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
noremap <leader><leader>A :EasyAlign

"Vim-LaTex Settings
let g:tex_flavor = 'latex'
nnoremap <leader>L :LLPStartPreview<CR>

" Add MASM highlighting
let g:asmsytax = 'masm'

" VSCode Mappings for Vimspector  etc
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
nnoremap <silent><leader>dr :VimspectorReset<CR>
vnoremap <silent><leader>dr :VimspectorReset<CR>

" remap watch command to be shorter
cnoreabbrev vsw VimspectorWatch
nnoremap <leader>W :VimspectorWatch <C-R>0<CR>
vnoremap <leader>W :VimspectorWatch <C-R>0<CR>
" Emmet Mappings
autocmd FileType .html,.css EmmetInstall

" Vim Maximizer Mapppings
nnoremap <silent><leader>M :MaximizerToggle<CR>
vnoremap <silent><leader>M :MaximizerToggle<CR>gv
inoremap <silent><leader>M <C-o>:MaximizerToggle<CR>

