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

" Vundle plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlp.vim'
Plugin 'tender.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-signify'
Plugin 'fugitive.vim'
call vundle#end()       

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

" mapping keys
map <F11> <Esc>:call ToggleGUICruft()<cr>
map <F9> :YcmCompleter FixIt<CR>
map <f> :YcmDiags<CR>
map <space> /
map <c-space> ?
map :tn :tabnew<cr>
map :to :tabonly<cr>
map :tc :tabclose<cr>
map :tm :tabmove
map gg :split<cr>:YcmCompleter GoTo<cr>
map :ggl :GitGutterLineHighlightsToggle<cr>
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
nmap <F8> :TagbarToggle<CR>
nmap <Enter> :w<cr>
nnoremap <F3> :set hlsearch!<CR>

" ctrlp settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" vim-gitgutter settings
let g:gitgutter_grep=''
:execute "normal \<Plug>GitGutterEnable"
set updatetime=250

" airline
let g:airline_theme = 'tender'
let g:airline_enable_fugitive=1
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_linenr = '␊'
let g:airline_linecolumn_prefix = '¶ '
let g:airline_fugitive_prefix = '⎇ '
let g:airline_paste_symbol = 'ρ'
let g:airline_section_c = '%t'
set laststatus=2
let g:airline_powerline_fonts = 1
set linespace=0

let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#ycm#error_symbol = 'E:'
let g:airline#extensions#ycm#warning_symbol = 'W:'

function! AirlineInit()
  let g:airline_section_b = airline#section#create(['branch'])
  let g:airline_section_x = airline#section#create(['hunks'])
  let g:airline_section_y = '%y'
endfunction
autocmd User AirlineAfterInit call AirlineInit()

let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }

