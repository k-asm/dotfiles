"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('itchyny/lightline.vim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" ステータスライン
" --------------------
set laststatus=2        " ステータスラインを常に表示する
set ruler               " ルーラを表示する

" インデント
" --------------------
set smartindent         " 改行時にオートインデント
set expandtab           " tab -> spaces
filetype plugin indent on       " ファイルタイプに合わせたインデントを利用
if has("autocmd")
  autocmd FileType perl setlocal ts=4 sts=4 sw=4
  autocmd FileType cpp  setlocal ts=4 sts=4 sw=4
  autocmd FileType c    setlocal ts=4 sts=4 sw=4
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2
endif

" 表示
" --------------------
set number              " 行番号を表示
set showmatch           " 括弧の対応をハイライト

" コマンド補完
" --------------------
set wildchar=<tab>      " TABキーでコマンド補完を開始
set wildmode=list:longest,list:full  " リスト表示, 最長マッチ

" denite
" --------------------
nnoremap [denite] <Nop>
nmap     <Space>u [denite]
nnoremap <silent> [denite]b :<C-u>Denite buffer<CR>
nnoremap <silent> [denite]a :<C-u>Denite -buffer-name=files buffer file_mru file<CR>
call denite#custom#map(
  \ 'insert',
  \ '<C-N>',
  \ '<denite:move_to_next_line>',
  \ 'noremap'
  \)
call denite#custom#map(
  \ 'insert',
  \ '<C-P>',
  \ '<denite:move_to_previous_line>',
  \ 'noremap'
  \)

" deoplete
" --------------------
let g:deoplete#enable_at_startup = 1

" NERDTree
" --------------------
nnoremap [nerdtree] <Nop>
nmap     <Space>n [nerdtree]
nnoremap [nerdtree]t :<C-u>NERDTreeToggle<CR>

let g:NERDTreeShowHidden=1 " 隠しファイルを表示する
let g:NERDTreeDirArrowExpandable  = '+' " ツリー表示
let g:NERDTreeDirArrowCollapsible = '-' " ツリー表示

" 検索
" --------------------
set wrapscan            " 最後まで検索したら先頭へ
set ignorecase          " 大文字小文字を区別しない
set smartcase           " 大文字が含まれていたら区別する

" 色
" --------------------
let g:solarized_termcolors=256
colorscheme solarized

" バックアップ
" --------------------
set backup              " バックアップを有効化
set backupdir=~/.vim_backup
set swapfile            " スワップファイルを作成
set directory=~/.vim_swap

" 移動
" --------------------
" insert mode 中のカーソル移動
inoremap <C-e> <END>
inoremap <C-a> <HOME>
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-b> <Left>
inoremap <C-f> <Right>

" タブ関係
" ---------------------
nnoremap [tab] <Nop>
nmap     <Space>t [tab]
nnoremap <silent> [tab]c :<c-u>tabnew<cr>
nnoremap <silent> [tab]n :<c-u>tabnext<cr>
nnoremap <silent> [tab]p :<c-u>tabprevious<cr>
nnoremap <silent> [tab]x :<c-u>tabclose<cr>

" ColorColumn
" ---------------------
set colorcolumn=80

" Highlights
" ---------------------
augroup HighlightTrailingSpaces
    autocmd!
    autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
    autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
