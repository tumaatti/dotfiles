syntax on

set encoding=utf-8
set mouse=a
set showmatch
set hidden
set nohlsearch
set noerrorbells
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set nowrap
set ignorecase smartcase
set noswapfile
set nobackup
set incsearch
set termguicolors
set noshowmode
set completeopt=menuone,noinsert,noselect
set expandtab

set updatetime=50

" show nbsp as +
set list
set listchars=nbsp:+

set inccommand=split

call plug#begin(stdpath('data') . '/plugged')

" neovim lsp plugins
Plug 'mhinz/vim-startify'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'

Plug 'hoob3rt/lualine.nvim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'norcalli/nvim-colorizer.lua'

"Plug 'tweekmonster/gofmt.vim'
Plug 'vim-utils/vim-man'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

Plug 'ayu-theme/ayu-vim'
Plug 'fneu/breezy'
Plug 'morhetz/gruvbox'
Plug 'liuchengxu/vim-which-key'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'nvie/vim-flake8'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'


call plug#end()

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let ayucolor="mirage"
colorscheme ayu
" set transparent background
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "


lua require('telescope').setup({defaults = {file_sorter = require('telescope.sorters').get_fzy_sorter}})
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_localrmdir='rm -r'

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>

nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>bd :bd!<CR>
nnoremap <leader>bn :bn!<CR>
nnoremap <leader>bp :bp!<CR>
nnoremap <leader>sl :vsplit<CR>:wincmd l<CR>
nnoremap <leader>sj :split<CR>:wincmd j<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap X "_d
nnoremap <Leader>tn :terminal <CR>:file terminal<CR>
nnoremap <Leader>tl :terminal<CR>:vsplit<CR>:bn<CR>:wincmd l<CR>
tnoremap <Esc> <C-\><C-n>

nnoremap <leader>1 :b! 1<CR>
nnoremap <leader>2 :b! 2<CR>
nnoremap <leader>3 :b! 3<CR>
nnoremap <leader>4 :b! 4<CR>
nnoremap <leader>5 :b! 5<CR>
nnoremap <leader>6 :b! 6<CR>
nnoremap <leader>7 :b! 7<CR>
nnoremap <leader>8 :b! 8<CR>
nnoremap <leader>9 :b! 9<CR>
nnoremap <leader>tt :b! terminal<CR>

nnoremap <silent> <leader> :WhichKey '<space>'<CR>
set timeoutlen=500

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.jedi_language_server.setup{ on_attach=require'completion'.on_attach }
" lua require'nvim_lsp'.sumneko_lua.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.gopls.setup{ on_attach=require'completion'.on_attach }

com! W w
com! Wq wq

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline_theme = 'ayu'

autocmd BufWritePost *.py call Flake8()

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup TUOMO
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

lua require'colorizer'.setup()

lua <<EOF
    local lualine = require('lualine')
    lualine.theme = 'gruvbox'
    lualine.separator = '|'
    lualine.sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch' },
      lualine_c = { 'filename' },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location'  },
      lualine_diagnostics = {  }
    }
    lualine.inactiveSections = {
      lualine_a = {  },
      lualine_b = {  },
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {  },
      lualine_z = {   }
    }
    lualine.extensions = { 'fzf' }
    lualine.status()
EOF
