set anti gfn=Iosevka\ 11
 
".vimrc
map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>


noremap <F3> :Autoformat<CR>
inoremap jk <Esc>`^
" Nerdtree
map <C-a> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
" Vim emmet workaround
let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")


call plug#begin('~/.vim/plugged')

Plug 'Chiel92/vim-autoformat'
"Plug 'Valloric/YouCompleteMe'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'flazz/vim-colorschemes'
Plug 'mattn/emmet-vim'
Plug 'posva/vim-vue'
Plug 'junegunn/goyo.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'https://github.com/atelierbram/Base2Tone-vim'
Plug 'https://github.com/chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system with:PlugInstall
call plug#end()

if $TERM == "rxvt-unicode-256color"
  set t_Co=256
endif

syntax on
set number
set cursorline

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" " dialogue asking if you wish to save changed files.
set confirm

" Do not save ~
set nobackup
set nowritebackup

colorscheme onedark

" Goyo

map <C-g> :Goyo<CR>


let g:goyo_linenr = 1
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  set number
  set cursorline
  " ...
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  set number
  Limelight!
  " ...
endfunction
