" Setup ----------
set encoding=utf8
set nomodeline
set nowrap
autocmd FileType markdown setlocal wrap
filetype plugin indent on
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_Co=256
let base16colorspace=256  " Access colors present in 256 colorspace
if (has("termguicolors"))
  set termguicolors
endif

" Plugins ----------
call plug#begin('~/.vim/plugged')

" System
Plug 'Shougo/unite.vim'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'cohama/lexima.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'qpkorr/vim-bufkill'
" Programming
Plug 'elzr/vim-json'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'othree/html5.vim'
Plug 'othree/html5-syntax.vim'
Plug 'mattn/emmet-vim'
Plug 'mxw/vim-jsx'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'sheerun/vim-polyglot'
Plug 'valloric/MatchTagAlways'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'moll/vim-node'
" Themes
Plug 'KeitaNakamura/neodark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'lifepillar/vim-wwdc16-theme'
Plug 'rakr/vim-one'
call plug#end()
" Plugins End ----------


" Plugin Inits ---------
let g:indentLine_enabled = 1
let g:indentLine_char = "┆"
let g:user_emmet_install_global = 0
let g:user_emmet_mode='n'
let g:user_emmet_leader_key='<Leader>e'
let g:used_javascript_libs = 'underscore,backbone,jquery,react,jasmine, chai'
let g:deoplete#enable_at_startup = 1
let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0
let g:vim_jsx_pretty_colorful_config = 1
let g:vim_jsx_pretty_enable_jsx_highlight = 1
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_flagship_statusline = 1
let g:mustache_abbreviations = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
let g:semanticGUIColors = ['#e5c07b', '#e16c74', '#87af87', '#c678dd', '#55b6c2']
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'javascript.jsx' : 1,
    \ 'jinja' : 1,
    \ 'liquid' : 1,
    \ 'markdown' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \}

let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.js,*.html.erb,*.md'
let g:airline#extensions#tabline#enabled = 1
let g:indent_guides_exclude_filetypes = ['nerdtree']
" AutoCMD
autocmd FileType html,css EmmetInstall
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd w
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 1
autocmd BufReadPre *.js let b:javascript_lib_use_react = 1
autocmd BufReadPre *.js let b:javascript_lib_use_jasmine = 1
autocmd BufReadPre *.js let b:javascript_lib_use_chai = 1
autocmd FileType scss set iskeyword+=-
au BufRead,BufNewFile *.scss set ft=scss.css
au BufNewFile,BufRead *.handlebars set ft=html
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END
" Remappings
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
nnoremap <Leader>o :CtrlP<CR>
map ` :NERDTreeToggle<CR>
" Plugin Inits End -----


" General ----------
syntax on
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif
set tabstop=3
set shiftwidth=3
set shiftwidth=3
set expandtab
set number
set relativenumber
set numberwidth=1
set nobackup
set noswapfile
set nowrap
set hidden
set incsearch
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set cursorline
set laststatus=2
set mouse=r
set showtabline=1
set splitbelow
set splitright
set fillchars=vert:\│

" Key Remappings ---------
let mapleader = ','
nnoremap q <Nop>
nnoremap Q <Nop>
nnoremap <leader>, <esc>
inoremap <leader>, <esc>
vnoremap <leader>, <esc>
cnoremap <leader>, <esc>
nnoremap ; :
noremap H ^
noremap L g_
noremap J 5j
noremap K 5k
vmap < <gv
vmap > >gv
nnoremap <leader>, :noh<CR>

nmap <leader>v :tabedit $MYVIMRC<CR>
nmap <leader>r :source $MYVIMRC<cr>
nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>
nmap <leader>x :BD<cr>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprev!<CR>

" Themes ---------
set background=dark
let g:one_allow_italics = 1
colorscheme one
call one#highlight('StatusLineNC', '', '2c323c', 'none')

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 5

nmap <leader>s :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Make the cursor stay on the same line when window switching
function! KeepCurrentLine(motion)
  let theLine = line('.')
  let theCol = col('.')
  exec 'wincmd ' . a:motion
  if &diff
    call cursor(theLine, theCol)
  endif
endfunction
nnoremap <C-w>h :silent call KeepCurrentLine('h')<CR>
nnoremap <C-w>l :silent call KeepCurrentLine('l')<CR>

"GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

