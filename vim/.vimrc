" Plugins
call plug#begin(stdpath('data') . '/plugged')


" Statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File browsing
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'

" Focus mode
Plug 'junegunn/goyo.vim'

" Note taking
Plug 'vimwiki/vimwiki'

" Code stuff
Plug 'tpope/vim-surround'
Plug 'ap/vim-css-color'
Plug 'OmniSharp/omnisharp-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'alvan/vim-closetag'

" Movement
Plug 'justinmk/vim-sneak'
Plug 'easymotion/vim-easymotion'

" Misc
Plug 'sickill/vim-pasta'
Plug 'arcticicestudio/nord-vim'


" Vim airline theme
let g:airline_theme = 'deus'

" Initialize plugin system
call plug#end()

let g:tagbar_ctags_bin='~/.vim/ctags-5.8/ctags'
let g:vimwiki_list = [{'path': '~/Asiakirjat/vimwiki/', 'path_html': '~/Asiakirjat/vimwiki_html/'}]
let g:airline_powerline_fonts = 0
" path to directory where library can be found
let g:clang_library_path='/usr/lib/llvm-3.8/lib'
" or path directly to the library file
let g:clang_library_path='/usr/lib64/libclang.so.3.8'
let mapleader = ","

" Set path to current file location
set path=.,**
setlocal path=,.**

" Disable spaw
set noswapfile


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Käynnistyskomentoja
set linebreak
set relativenumber
set number
set smartcase
set ignorecase
set tabstop=4
set shiftwidth=4
set softtabstop=0 noexpandtab
colorscheme nord

map <C-n> :NERDTreeToggle<CR>
map <C-f> :Goyo<CR>
nmap <F8> :TagbarToggle<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Auto bracket completion
"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Custom commands
command Notes set nonumber | set norelativenumber | set linebreak | Goyo

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
