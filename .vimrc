execute pathogen#infect()
syntax on
set number
filetype plugin indent on

set backspace=2

set foldmethod=syntax
set nofoldenable

inoremap { {}<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap " ""<left>
inoremap ' ''<left>

nnoremap <C-C>" <C-W>s
nnoremap <C-C>% <C-W>v
nnoremap <C-C><left> <C-W><C-H>
nnoremap <C-C><right> <C-W><C-L>
nnoremap <C-C><up> <C-W><C-K>
nnoremap <C-C><down> <C-W><C-J>
nnoremap <C-C>< <C-W><
nnoremap <C-C>> <C-W>>
nnoremap <C-C>= <C-W>+
nnoremap <C-C>- <C-W>-

map <C-n> :NERDTreeToggle<CR>

hi Search ctermbg=LightYellow

set background=light
"colorscheme solarized
"colorscheme molokai
""colorscheme phd

call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --go-completer' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'posva/vim-vue'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'nvie/vim-flake8'
Plug 'maksimr/vim-jsbeautify'
Plug 'rizzatti/dash.vim'
Plug 'leafgarland/typescript-vim'
call plug#end()

execute pathogen#infect()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_error_symbol='✗'
" 设置警告符号
let g:syntastic_warning_symbol='⚠'

let g:syntastic_mode_map = {'mode': 'passive'} 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['govet', 'errcheck', 'go']
let g:syntastic_javascript_checkers = ['jshint']

let g:go_fmt_command = "goimports"

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

  "设置切换Buffer快捷键"
nnoremap <C-L> :bn<CR>
nnoremap <C-P> :bp<CR>

nmap <F8> :TagbarToggle<CR>

"修复syntastic使用:lnext和:lprev出现的跳转问题，同时修改键盘映射使用sn和sp进行跳转
function! <SID>LocationPrevious()                       
  try                                                   
    lprev                                               
  catch /^Vim\%((\a\+)\)\=:E553/                        
    llast                                               
  endtry                                                
endfunction                                             
function! <SID>LocationNext()                           
  try                                                   
    lnext                                               
  catch /^Vim\%((\a\+)\)\=:E553/                        
    lfirst                                              
  endtry                                                
endfunction                                             
nnoremap <silent> <Plug>LocationPrevious    :<C-u>exe 'call <SID>LocationPrevious()'<CR>                                        
nnoremap <silent> <Plug>LocationNext        :<C-u>exe 'call <SID>LocationNext()'<CR>
nmap <silent> sp    <Plug>LocationPrevious              
nmap <silent> sn    <Plug>LocationNext
nmap ss    :w<CR>:SyntasticCheck<CR>
