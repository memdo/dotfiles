source $HOME/.config/nvim/vim-plug/plugins.vim

fu Run()
	if &filetype ==# 'python'
		exec winheight(0)/2."split" | terminal pipenv run python % elseif &filetype ==# 'javascript'
		exec winheight(0)/2."split" | terminal node %
	elseif &filetype ==# 'c'
    	" exec winheight(0)/2."split" | terminal gcc % -o main -lm -std=iso9899:1990; ./main
        exec winheight(0)/2."split" | terminal gcc % -o main -lm; ./main 
    elseif &filetype ==# 'rust'
		exec winheight(0)/2."split" | terminal cargo run
	elseif &filetype ==# 'java'
		" exec winheight(0)/2."split" | terminal java -classpath /home/berkay/Desktop/Algorithms/lib/algs4.jar %
        exec winheight(0)/2."split" | terminal java %
	elseif &filetype ==# 'cpp'
		exec winheight(0)/2."split" | terminal g++ % -o main -Wall -lm; ./main
	else
		echom "unsupported filetype"
	endif
endfu

set scl=no
set number
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap
set termguicolors
set splitbelow
set cmdheight=1

let g:airline_theme="base16_monokai"
let g:airline#extensions#tabline#enabled=0
let g:NERDTreeWinSize=20
let g:NERDTreeShowHidden=1
let g:auto_save=1
let g:onedark_termcolors=256
let g:gruvbox_constrast_dark="soft"
let g:gruvbox_transparent_bg=1
let g:seiya_auto_enable=1
let g:seiya_target_groups = has('nvim') ? ['guibg'] : ['ctermbg']
colorscheme onedark

map <C-k> :NERDTreeToggle<CR>
map <C-l> :call Run()<CR>:call feedkeys("a")<CR>
tnoremap <Esc> <C-\><C-n>

lua << EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true
    },
    incremental_selection = {
        enable = true,
        keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
        }
    },
    indent = {
        enable = false
    }
}
EOF

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <C-Space> coc#refresh()

inoremap <silent><expr> <CR> coc#_select_confirm()
