if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    Plug 'yuezk/vim-js'
    
    " Term Transparency
    Plug 'miyakogi/seiya.vim'

    " Color Preview
    Plug 'ap/vim-css-color'    

    " File Explorer
    Plug 'scrooloose/NERDTree'

    " Theme
    Plug 'cocopon/iceberg.vim'
    Plug 'Luxed/ayu-vim'
    Plug 'joshdick/onedark.vim'
    Plug 'fatih/molokai'
    Plug 'ErichDonGubler/vim-sublime-monokai'
    Plug 'morhetz/gruvbox'

    " Autocompletion
    Plug 'neoclide/coc.nvim',{'branch': 'release'}

    " Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    
    " Auto Pairs (brackets etc.)
    Plug 'jiangmiao/auto-pairs'

    " Autosave
    Plug '907th/vim-auto-save'
call plug#end()
