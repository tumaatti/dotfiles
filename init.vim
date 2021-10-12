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
set updatetime=500
set inccommand=split

set signcolumn=yes

call plug#begin(stdpath('data') . '/plugged')

" :CocInstall coc-clangd coc-tsserver coc-eslint coc-json coc-prettier coc-css coc-python coc-tailwindcss
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'pantharshit00/vim-prisma'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
" neovim lsp plugins
Plug 'mhinz/vim-startify'
" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'
" Plug 'tjdevries/nlua.nvim'
Plug 'ThePrimeagen/harpoon'
" Plug 'tjdevries/lsp_extensions.nvim'

Plug 'hoob3rt/lualine.nvim'
" Plug 'jose-elias-alvarez/buftabline.nvim'
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
Plug 'ryanoasis/vim-devicons'

Plug 'pacokwon/onedarkhc.vim'
Plug 'folke/tokyonight.nvim'

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
let mapleader = ","

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
nmap <silent> <Leader>d <Plug>(coc-definition)
nmap <silent> <Leader>t <Plug>(coc-type-definition)
nmap <silent> <Leader>i <Plug>(coc-implementation)
nmap <silent> <Leader>r <Plug>(coc-references)

nnoremap <leader>hw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>s /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>
" buffers
nnoremap <space>bb :Buffers<CR>
nnoremap <space>bd :bd!<CR>
nnoremap <space>bn :bn!<CR>
nnoremap <space>bp :bp!<CR>
" split window
nnoremap <space>sl :vsplit<CR>:wincmd l<CR>
nnoremap <space>sj :split<CR>:wincmd j<CR>
nnoremap <space>sf :MaximizerToggle!<CR>
nnoremap <space>stn :terminal <CR>:file terminal<CR>
nnoremap <space>stl :terminal<CR>:vsplit<CR>:bn<CR>:wincmd l<CR>
" window movements
nnoremap <c-h> :wincmd h<CR>
nnoremap <c-j> :wincmd j<CR>
nnoremap <c-k> :wincmd k<CR>
nnoremap <c-l> :wincmd l<CR>
" nnoremap <leader>f :Telescope file_browser<CR>
nnoremap <space>f :NERDTreeToggle<CR>
" telescope
nnoremap <space>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <space>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <space>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <space>pf :lua require('telescope.builtin').find_files()<CR>

nnoremap <space>a :lua require("harpoon.mark").add_file()<CR>

nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>

nnoremap <space>j :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <space>k :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <space>l :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <space>ö :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <space>tj :lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <space>tk :lua require("harpoon.term").gotoTerminal(2)<CR>
nnoremap <space>cu :lua require("harpoon.term").sendCommand(1, 1)<CR>
nnoremap <space>ce :lua require("harpoon.term").sendCommand(1, 2)<CR>

nnoremap <space><CR> :so ~/.config/nvim/init.vim<CR>

nnoremap <space>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap < <gv
vnoremap > >gv
tnoremap <Esc> <C-\><C-n>

nnoremap <space>m :MarkdownPreview<CR>

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap * *zz

nnoremap <silent> <leader> :WhichKey '<leader>'<CR>
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

" autocmd BufWritePost *.py call Flake8()
autocmd BufNewFile,BufRead *.py set textwidth=80

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

fun! RunFormat()
    let l:save = winsaveview()
    if &ft =~ 'vim'
        return
    endif
    if &ft =~ 'yml'
        return
    endif
    call CocAction('format')
    call winrestview(l:save)
endfun

augroup TUOMO
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
    autocmd BufWritePre typescript,python,json,markdown :call RunFormat()
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

" lua require("buftabline").setup {}

" coc-stuff
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <leader>h :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
