" Setup ----------
set encoding=utf-8
set nomodeline
set nowrap
autocmd FileType markdown setlocal wrap


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

" Themes
Plug 'KeitaNakamura/neodark.vim'
Plug 'itchyny/lightline.vim'
call plug#end()
" Plugins End ----------


" Plugin Inits ---------
let g:indentLine_enabled = 1
let g:indentLine_char = "⟩"
" NerdTree 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Remappings
nnoremap <Leader>o :CtrlP<CR>
map ` :NERDTreeToggle<CR>
" Plugin Inits End -----


" General ----------
syntax on
set clipboard=unnamed
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


" Key Remappings --------- 
let mapleader = ','
nnoremap <leader>, <esc>
inoremap <leader>, <esc>
vnoremap <leader>, <esc>
nnoremap ; :
noremap H ^
noremap L g_
noremap J 5j
noremap K 5k
vmap < <gv
vmap > >gv

nmap <leader>v :tabedit $MYVIMRC<CR>
nmap <leader>x :source $MYVIMRC<cr>
nmap <leader>w :w!<cr>

nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprev!<CR><Paste>


" Themes ---------
set background=dark
colorscheme neodark
let g:neodark#background = '#202020'
"let g:neodark#use_256color = 1 " default: 0
"let g:neodark#use_custom_terminal_theme=1

let g:lightline = {
   \ 'enable': {'statusline': 1, 'tabline': 0},
   \ 'colorscheme': 'neodark',
   \ 'mode_map': { 'c': 'NORMAL' },
   \ 'active': {
   \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
   \ },
   \ 'component_function': {
   \   'modified': 'LightLineModified',
   \   'readonly': 'LightLineReadonly',
   \   'fugitive': 'LightLineFugitive',
   \   'filename': 'LightLineFilename',
   \   'fileformat': 'LightLineFileformat',
   \   'filetype': 'LightLineFiletype',
   \   'fileencoding': 'LightLineFileencoding',
   \   'mode': 'LightLineMode',
   \ },
   \   'component': {
   \     'readonly': '%{&readonly?"⭤":""}',
   \   },
   \ }

function! LightLineModified()
   return &ft =~ 'help\|vimfiler' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
   return &ft !~? 'help\|vimfiler' && &readonly ? '⭤' : ''
endfunction

function! LightLineFilename()
   let fname = expand('%:t')
   return fname == 'ControlP' ? g:lightline.ctrlp_item :
      \ fname == '__Tagbar__' ? g:lightline.fname :
      \ fname =~ 'NERD_tree' ? '' :
      \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
      \ &ft == 'unite' ? unite#get_status_string() :
      \ &ft == 'vimshell' ? vimshell#get_status_string() :
      \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
      \ ('' != fname ? fname : '[No Name]') .
      \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
   try
      if expand('%:t') !~? 'Tagbar\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = '⭠ '  " edit here for cool mark
      let _ = fugitive#head()
         return strlen(_) ? mark._ : ''
      endif
      catch
   endtry
      return ''
endfunction

function! LightLineFileformat()
   return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
   return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
   return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
   let fname = expand('%:t')
   return fname == 'ControlP' ? 'CtrlP' :
     \ fname == '__Tagbar__' ? 'Tagbar' :
     \ fname =~ 'NERD_tree' ? 'NERDTree' :
     \ &ft == 'unite' ? 'Unite' :
     \ &ft == 'vimfiler' ? 'VimFiler' :
     \ &ft == 'vimshell' ? 'VimShell' :
     \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
   if expand('%:t') =~ 'ControlP'
      call lightline#link('iR'[g:lightline.ctrlp_regex])
      return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
                         \ , g:lightline.ctrlp_next], 0)
   else
      return ''
   endif
endfunction

let g:ctrlp_status_func = {
   \ 'main': 'CtrlPStatusFunc_1',
   \ 'prog': 'CtrlPStatusFunc_2',
   \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
   let g:lightline.ctrlp_regex = a:regex
   let g:lightline.ctrlp_prev = a:prev
   let g:lightline.ctrlp_item = a:item
   let g:lightline.ctrlp_next = a:next
   return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
   return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
   let g:lightline.fname = a:fname
   return lightline#statusline(0)
endfunction

