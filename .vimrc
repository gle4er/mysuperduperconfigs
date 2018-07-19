" settings

set ai
set si
set wrap
set foldmethod=syntax
set nu
set sm
set autoread
set ignorecase
set incsearch
set encoding=utf8
set expandtab
set smarttab
set hlsearch
set magic
set shiftwidth=4
set tabstop=4
set wildignore=*.o,*~,*.pyc
set history=700		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set langmap=!\\"№\\;%?*ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;!@#$%&*`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
inoremap <C-U> <C-G>u<C-U>
set guifont=Hack\ Regular\ 10 
set showtabline=0
set clipboard=unnamed
set nocompatible
set encoding=utf-8 
set termencoding=utf-8                              " set terminal encoding
set fileencoding=utf-8                              " set save encoding
set fileencodings=utf8,koi8r,cp1251,cp866
set hlsearch!
syntax enable
filetype plugin indent on

" vim-theming
set termguicolors
set background=dark
colorscheme tender

" GVim gui toggling
function! ToggleGUICruft()
  if &guioptions=='i'
    exec('set guioptions=imTrL')
  else
    exec('set guioptions=i')
  endif
endfunction

set guioptions=i
