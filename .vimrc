" -- Global Configuration --------------------------------------------------------------------------

" General
set nocompatible " Use Vim settings, rather then Vi settings
set encoding=utf-8 " Default encoding

" Syntax
set background=dark
colorscheme jellybeans
set t_Co=256
set cursorline
syntax on

:imap ii <Esc>

" Indentation
set tabstop=3
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set cindent
map <Tab> >gv
map <S-Tab> <gv
