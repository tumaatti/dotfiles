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
set textwidth=100
set scrolloff=8
set list
set updatetime=50
set inccommand=split

call plug#begin(stdpath('data') . '/plugged')

" :CocInstall coc-clangd coc-tsserver coc-eslint coc-json coc-prettier coc-css coc-python coc-tailwindcss
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
" neovim lsp plugins
Plug 'mhinz/vim-startify'
" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'
" Plug 'tjdevries/nlua.nvim'
Plug 'ThePrimeagen/harpoon'
" Plug 'tjdevries/lsp_extensions.nvim'

Plug 'hoob3rt/lualine.nvim'
Plug 'jose-elias-alvarez/buftabline.nvim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'tweekmonster/gofmt.vim'
Plug 'vim-utils/vim-man'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

Plug 'ayu-theme/ayu-vim'
Plug 'fneu/breezy'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'b4skyx/serenade'
Plug 'jacobPenney/vim-dissonance'
Plug 'vim-scripts/Wombat'
Plug 'tiagovla/tokyodark.nvim'

Plug 'liuchengxu/vim-which-key'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'nvie/vim-flake8'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'szw/vim-maximizer'

Plug 'kyazdani42/nvim-web-devicons'

Plug 'pacokwon/onedarkhc.vim'

call plug#end()

" if exists('+termguicolors')
"     let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"     let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" endif

let ayucolor="dark"
let g:tokyodark_transparent_background = 1
let g:gruvbox_contrast_dark = "soft"
colorscheme onedark
" set transparent background
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

let g:maximizer_set_default_mapping = 0

" lua require'lspconfig'.prismals.setup{}
lua require('telescope').setup({defaults = {file_sorter = require('telescope.sorters').get_fzy_sorter}, file_ignore_patterns = { "venv" }})
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_localrmdir='rm -r'

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" lsp
" nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
" nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
" nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
" nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
" nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
" nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
" nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>

" coc
nmap <silent> <Leader>vd <Plug>(coc-definition)
nmap <silent> <Leader>vt <Plug>(coc-type-definition)
nmap <silent> <Leader>vi <Plug>(coc-implementation)
nmap <silent> <Leader>vr <Plug>(coc-references)

nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>gs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>
" buffers
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>bd :bd!<CR>
nnoremap <leader>bn :bn!<CR>
nnoremap <leader>bp :bp!<CR>
" split window
nnoremap <leader>sl :vsplit<CR>:wincmd l<CR>
nnoremap <leader>sj :split<CR>:wincmd j<CR>
nnoremap <Leader>sf :MaximizerToggle!<CR>
nnoremap <Leader>stn :terminal <CR>:file terminal<CR>
nnoremap <Leader>stl :terminal<CR>:vsplit<CR>:bn<CR>:wincmd l<CR>
" window movements
nnoremap <c-h> :wincmd h<CR>
nnoremap <c-j> :wincmd j<CR>
nnoremap <c-k> :wincmd k<CR>
nnoremap <c-l> :wincmd l<CR>
nnoremap <leader>f :Telescope file_browser<CR>
" telescope
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>

nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>

nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>

nnoremap <leader>j :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>k :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>l :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>ö :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader>tj :lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <leader>tk :lua require("harpoon.term").gotoTerminal(2)<CR>
nnoremap <leader>cu :lua require("harpoon.term").sendCommand(1, 1)<CR>
nnoremap <leader>ce :lua require("harpoon.term").sendCommand(1, 2)<CR>

nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap < <gv
vnoremap > >gv
tnoremap <Esc> <C-\><C-n>

nnoremap <leader>m :MarkdownPreview<CR>

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

nnoremap <silent> <leader> :WhichKey '<space>'<CR>
set timeoutlen=500

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
" lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.jedi_language_server.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.tailwindcss.setup{}
" " lua require'nvim_lsp'.sumneko_lua.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.gopls.setup{ on_attach=require'completion'.on_attach }

com! W w
com! Wq wq

autocmd BufWritePost *.py call Flake8()
autocmd BufNewFile,BufRead *.py set textwidth=80

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

lua << EOF
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'tokyodark',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
EOF

lua require("buftabline").setup {}
