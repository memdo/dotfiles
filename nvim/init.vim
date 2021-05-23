source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/plug-config/coc.vim

"filetype plugin indent on
"syntax on 

fu Run()
	if &filetype ==# 'python'
		exec winheight(0)/2."split" | terminal python %
	elseif &filetype ==# 'javascript'
		exec winheight(0)/2."split" | terminal node %
	elseif &filetype ==# 'c'
    	" exec winheight(0)/2."split" | terminal gcc % -o main -lm -std=iso9899:1990; ./main
        exec winheight(0)/2."split" | terminal gcc % -o main -lm; ./main 
    elseif &filetype ==# 'rust'
		exec winheight(0)/2."split" | terminal cargo run
	elseif &filetype ==# 'java'
		exec winheight(0)/2."split" | terminal java -classpath /home/berkay/Desktop/Algorithms/lib/algs4.jar %
	elseif &filetype ==# 'cpp'
		exec winheight(0)/2."split" | terminal g++ % -o main -Wall -lm; ./main
	else
		echom "unsupported filetype"
	endif
endfu

exec "set t_8f=\e[38;2;%lu;%lu;%lum"
exec "set t_8b=\e[48;2;%lu;%lu;%lum"
set t_Co=256

set scl=no
set number
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap
set background=dark
set encoding=UTF-8
set termguicolors
set splitbelow
set cmdheight=1
set nocompatible

let g:airline_theme="onedark"
let g:NERDTreeWinSize=20
let g:NERDTreeShowHidden=1
let g:auto_save=1
let g:tokyonight_style = "night"
let g:tokyonight_enable_italic = 1
let g:ayucolor="mirage"
let g:onedark_termcolors=256
let g:airline_left_sep = "\uE0B0"
let g:airline_right_sep = "\uE0B2"
let g:AutoPairsMapCR=0

" au VimEnter * NERDTree | wincmd p
" au VimEnter * call GetTerm()

colorscheme onedark

map <C-k> :NERDTreeToggle<CR>
map <C-l> :call Run()<CR>:call feedkeys("a")<CR>
tnoremap <Esc> <C-\><C-n>
