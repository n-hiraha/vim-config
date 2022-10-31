set shell=/bin/zsh


call plug#begin()

" vimのドキュメントを表示するplugin
Plug 'vim-jp/vimdoc-ja',
Plug 'tpope/vim-obsession'

" ファインダー
Plug 'lambdalisue/fern.vim'
" ファインダーでpreviewを表示
Plug 'yuki-yano/fern-preview.vim'
" ファインダーにgitの差分を表示
Plug 'lambdalisue/fern-git-status.vim'

" インデント表示のplugin
Plug 'nathanaelkane/vim-indent-guides'

" 空白表示のplugin
Plug 'bronson/vim-trailing-whitespace'

" lspのplugin
Plug 'dense-analysis/ale',
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ファイル検索のplugin
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } },
Plug 'junegunn/fzf.vim',

" vimで各言語を使うplugin
Plug 'pangloss/vim-javascript',
Plug 'leafgarland/typescript-vim',
Plug 'peitalin/vim-jsx-typescript',
Plug 'styled-components/vim-styled-components', { 'branch': 'main' },
Plug 'jparise/vim-graphql',
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" vim-airlineのplugin
Plug 'vim-airline/vim-airline',
Plug 'vim-airline/vim-airline-themes',

" ファイルの拡張子を扱うときにt買うplugin
Plug 'nathom/filetype.nvim',

" vimテーマplugin
Plug 'morhetz/gruvbox',

" 括弧の補完plugin
Plug 'cohama/lexima.vim',

" テキストを囲む
Plug 'machakann/vim-sandwich',
Plug 'yuki-yano/fzf-preview.vim',
Plug 'vim-scripts/vim-auto-save',

" snippets
Plug 'SirVer/ultisnips',
Plug 'honza/vim-snippets'

" Reactのsnippets
" Plug 'epilande/vim-react-snippets'
Plug 'mlaursen/vim-react-snippets'

" カラーコードをハイライト
Plug 'norcalli/nvim-colorizer.lua'

" oceanic-next'
Plug 'KeitaNakamura/neodark.vim'

" graphqlのsyntaxとか
Plug 'jparise/vim-graphql'

" auto importのコピペ 8/3
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'


Plug 'shaunsingh/nord.nvim'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" For ts Server
Plug 'hrsh7th/nvim-cmp'
Plug 'neovim/nvim-lspconfig'

" For TailwindCSS
Plug 'princejoogie/tailwind-highlight.nvim'

" For luasnip users.
" Plug 'L3MON4D3/LuaSnip'
" Plug 'saadparwaiz1/cmp_luasnip'

" For ultisnips users.
" Plug 'SirVer/ultisnips'
" Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" For snippy users.
" Plug 'dcampos/nvim-snippy'
" Plug 'dcampos/cmp-snippy'

Plug 'KeitaNakamura/neodark.vim'

" TODO 拡張子によって遅延読み込み

call plug#end()



" デフォルト設定
set shiftwidth=4
set tabstop=4
set number
set expandtab
set textwidth=0
set autoindent
set hlsearch
set clipboard=unnamed
syntax on
syntax enable
set background=dark
colorscheme neodark

"keymapの設定

" jjでノーマルモードに移行する
inoremap <silent> jj <ESC>
" タブの切り替え
nnoremap <silent> <C-l> :tabnext<CR>
nnoremap <silent> <C-h> :tabprevious<CR>
" ファイルを閉じる
nnoremap <C-q> :bd<CR>
" 1つ前のバッファ
nnoremap <C-h> :bprev<CR>
" 1つ後のバッファ
nnoremap <C-l> :bnext<CR>

" Plugin別の設定

" filetype
filetype plugin indent on

" 何これ
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }

" 例スペース + f でファイル検索 プリフィックスみたいなやつ。重要。
let mapleader = "\<Space>"

" fern.vim
" ファイルツリーを表示/非表示する
nnoremap <C-f> :Fern . -reveal=% -drawer -toggle -width=40<CR>

" 隠しファイルを表示する
let g:fern#default_hidden=1

" vim-auto-save 自動保存の設定
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

" vim-graphql
au BufNewFile,BufRead *.prisma setfiletype graphql

" fern-previewの設定
function! s:fern_settings() abort
  nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
  nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
  nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
  nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
endfunction

augroup fern-settings
  autocmd!
  autocmd FileType fern call s:fern_settings()
augroup END

" snippets設定
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" vim-airlineの設定
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='angr'


" ALE設定
let g:ale_floating_preview = 1
let g:ale_linters_explicit = 1

" 保存時にフォーマットする
let g:ale_fix_on_save = 1

" Lintの設定
let g:ale_linters = {
\   'typescript': ['eslint'],
\   'javascript': ['eslint'],
\   'vue': ['eslint', 'stylelint', 'vim-lsp'],
\   'scss': ['stylelint'],
\   'rust': ['clippy'],
\   'python': ['flake8'],
\}

" Formatの設定
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'vue': ['prettier', 'eslint', 'stylelint'],
\   'scss': ['prettier', 'eslint', 'stylelint'],
\   'go': ['gofmt'],
\   'python': ['autopep8', 'isort']
\}


let g:ale_linter_aliases = {'vue': ['vue', 'typescript', 'scss']}
let g:ale_python_auto_poetry = 1

" COC設定
"
" " GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <C-j> <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


" fzf.vim

nnoremap <C-p> :Files<CR>
nnoremap <C-g> :Rg<CR>

" noremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>g :GFiles<CR>
nnoremap <silent> <leader>G :GFiles?<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>r :Rg<CR>

" rigrep
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>r :Rg
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>w :Windows<CR>
nnoremap <Leader>h :History<CR>

let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git -o -name .next -o -name .idea -o -name .husky -o -name .public \) -prune -o -print'

let g:fzf_preview_window = ['bottom:50%', 'ctrl-/']

" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']


" vim内のFilesコマンドでプレビューを表示する
" fzf#vim#with_previewがなぜか呼び出されず、batコマンドへ直接PATHを通している。下のRgコマンドも同様
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'bat --style=numbers --color=always --line-range :500 {}']}, <bang>0)

" vim内のRgコマンドでプレビューを表示する
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)



" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

" " 最後のカーソル位置を復元する
" if has("autocmd")
"     autocmd BufReadPost *
"     \ if line("'\"") > 0 && line ("'\"") <= line("$") |
"     \   exe "normal! g'\"" |

lua require('plugins')
