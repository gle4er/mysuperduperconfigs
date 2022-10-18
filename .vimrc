" settings

set ai
set si
set wrap linebreak nolist
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
set history=700         " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set cursorline
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set langmap=!\\"№\\;%?*ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;!@#$%&*`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
inoremap <C-U> <C-G>u<C-U>
"set guifont=FuraCode\ Nerd\ Font\ Light:h16
set showtabline=0
set clipboard=unnamed
set nocompatible
set encoding=utf-8
set termencoding=utf-8                              " set terminal encoding
set fileencoding=utf-8                              " set save encoding
set fileencodings=utf8,koi8r,cp1251,cp866
set hlsearch!
filetype plugin indent on
syntax enable

" vim-theming
set termguicolors
set background=dark
colorscheme gruvbox

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
    "Plugin 'Valloric/YouCompleteMe'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'majutsushi/tagbar'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'ctrlp.vim'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'mhinz/vim-signify'
    Plugin 'fugitive.vim'
    Plugin 'bkad/CamelCaseMotion'
    Plugin 'jpalardy/vim-slime'
    "Plugin 'neomake/neomake'
    Plugin 'pearofducks/ansible-vim'
    "Plugin 'skywind3000/asyncrun.vim'
    Plugin 'mcchrish/nnn.vim'
    Plugin 'preservim/nerdtree'
    Plugin 'rodjek/vim-puppet'
    Plugin 'iamcco/markdown-preview.nvim'
    Plugin 'udalov/kotlin-vim'
    Plugin 'dense-analysis/ale'
call vundle#end()

" let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_show_diagnostics_ui = 0

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
map :ggl :GitGutterLineHighlightsToggle<cr>
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
nmap <F8> :TagbarToggle<CR>
nmap <Enter> :w<cr>
nmap <F7> gg=G
nmap , <c-e>
nmap . <c-y>
nnoremap <F3> :set hlsearch!<CR>

" YouCompleteMe (YCM) configuration
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

" camelCase motion
call camelcasemotion#CreateMotionMappings('<leader>')

" ctrlp settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/venv/*
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|\v[\/](venv|lint)',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" vim-gitgutter settings
let g:gitgutter_grep=''
:execute "normal \<Plug>GitGutterEnable"
set updatetime=250

" airline
"let g:airline_theme = 'tender'
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
let g:Powerline_symbols='unicode'

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
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }

" slime
let g:slime_target = "vimterminal"

" neomake
"call neomake#configure#automake('w')
"call neomake#configure#automake('nw', 750)
"call neomake#configure#automake('rw', 1000)
"call neomake#configure#automake('nrwi', 500)

"function! MyOnBattery()
  "if has('macunix')
    "return match(system('pmset -g batt'), "Now drawing from 'Battery Power'") != -1
  "elseif has('unix')
    "return readfile('/sys/class/power_supply/AC/online') == ['0']
  "endif
  "return 0
"endfunction

"if MyOnBattery()
  "call neomake#configure#automake('w')
"else
  "call neomake#configure#automake('nw', 1000)
"endif

" nnn
nnoremap <leader>n :NnnPicker '%:p:h'<CR>
let g:nnn#layout = 'new' " or vnew, tabnew etc.
let g:nnn#layout = { 'left': '~20%' } " or right, up, down
let g:nnn#action = {
      \ '<c-z>': 'split',
      \ '<c-e>': 'e',
      \ '<c-c>': 'vsplit' }

" nerdtree
nnoremap <leader>t :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggleVCS<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" markdown preview
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle

" ALE
let g:ale_completion_enabled = 1
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<TAB>"

let g:ale_linters = {'python': 'all'}
let g:ale_linters_ignore = {'python': ['pydocstyle']}
let g:ale_fixers = {'python': ['black', 'isort', 'yapf', 'remove_trailing_lines', 'trim_whitespace']}

let g:ale_floating_preview = 1
let g:ale_hover_to_floating_preview = 1
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']
augroup ale_hover_cursor
  autocmd!
  autocmd CursorHold * ALEHover
augroup END

let g:ale_lsp_suggestions = 1
let g:ale_go_gofmt_options = '-s'
let g:ale_go_gometalinter_options = '— enable=gosimple — enable=staticcheck'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %code: %%s'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
