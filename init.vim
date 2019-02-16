" kj to leave insert mode.
inoremap kj <Esc>

" Control keys to move panes like normal hjkl.
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Save everything on focus lost. Ignore unnamed buffer warnings, etc.
au FocusLost * silent! wa

" Line numbers in the left gutter.
set number

" Don't wrap long lines on the screen.
set nowrap

" New splits go below or to the right (personal preference).
set splitbelow
set splitright

" Don't get into EOL battles at the end of files.
set nofixendofline

" Match default bash behavior of tab-completion.
set wildmode=longest,list

" Adjust H, L, zt, zb to not go to the VERY top/bottom of the screen.
set scrolloff=3

" Automatically load changes. Sometimes.
set autoread

" Check for changes other times too.
au FocusGained,BufEnter * :checktime

filetype plugin on

" Compressed tabs when editing Go.
autocmd Filetype go setlocal tabstop=2 shiftwidth=2

call plug#begin('~/.local/share/nvim/plugged')
" Solarized color scheme.
Plug 'iCyMind/NeoSolarized'

" Git +/-/~ lines for diffs.
Plug 'airblade/vim-gitgutter'

" :Gblame and so on.
Plug 'tpope/vim-fugitive'

" File browser.
Plug 'scrooloose/nerdtree'

" Go development.
Plug 'fatih/vim-go'

" Comment out code.
Plug 'scrooloose/nerdcommenter'
call plug#end()

" goimports formats the file AND fixes the imports.
let g:go_fmt_command = "goimports"

let mapleader = ","

" NERDComment shortcuts I'm used to.
let g:NERDSpaceDelims=1
map <Leader>/ <plug>NERDCommenterToggle

" NERDTree shortcuts I'm used to.
map \ :NERDTreeToggle<CR>
map \| :NERDTreeFind<CR>

" Jump to go test file.
autocmd Filetype go map <Leader>t :GoAlternate<CR>

set termguicolors
colorscheme NeoSolarized
set background=dark

if has('gui_vimr')
" Suppress warning in vimr about old version of nvim.
    let g:go_version_warning = 0

" Enable command-shift-bracket to switch tabs.
" https://github.com/qvacua/vimr/issues/685#issuecomment-425682628
    nnoremap <S-D-{> :tabp<CR>
    vnoremap <S-D-{> :tabp<CR>
    inoremap <S-D-{> :tabp<CR>
    nnoremap <S-D-}> :tabn<CR>
    vnoremap <S-D-}> :tabn<CR>
    inoremap <S-D-}> :tabn<CR>
endif
