1 set number
  2                            
  3 let g:mapleader=','        
  4 syntax on
  5 set hlsearch               
  6 set pastetoggle=<F2>       
  7 inoremap jj <Esc>
  8 noremap <C-h> <C-w>h
  9 
 10 noremap <C-j> <C-w>j
 11 
 12 noremap <C-k> <C-w>k
 13 
 14 noremap <C-1> <C-w>l
 15 
 16 com! FormatJSON %!python3 -m json.tool
 17 
 18 " Specify a directory for plugins
 19 " - For Neovim: stdpath('data') . '/plugged'
 20 " - Avoid using standard Vim directory names like 'plugin'
 21 call plug#begin('~/.vim/plugged')
 22 Plug 'mhinz/vim-startify'
 23 Plug 'vim-airline/vim-airline'
 24 Plug 'vim-airline/vim-airline-themes'
 25 Plug 'Yggdroot/indentLine'
 26 Plug 'morhetz/gruvbox'
 27 Plug 'preservim/nerdtree'
 28  Plug 'ctrlpvim/ctrlp.vim'
 29 
 30 Plug 'easymotion/vim-easymotion'
 31 Plug 'sbdchd/neoformat'
 32 
 33 Plug 'dense-analysis/ale'
 34 Plug 'tpope/vim-commentary'
 35 Plug 'airblade/vim-gitgutter'
 36 Plug 'tpope/vim-fugitive'
 37 Plug 'junegunn/gv.vim'
 38 
 39 Plug 'tpope/vim-surround'
 40 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 41 Plug 'junegunn/fzf.vim'
 42 Plug 'brooth/far.vim'
 43 Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
 44 Plug 'preservim/tagbar'
 45 Plug 'lfv89/vim-interestingwords'
 46 if has('nvim')
 47   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
 48 else
 49   Plug 'Shougo/deoplete.nvim'
 50   Plug 'roxma/nvim-yarp'
 51   Plug 'roxma/vim-hug-neovim-rpc' 
 52 endif
 53 let g:deoplete#enable_at_startup = 1
 54 
 55 
56 
 57 
 58 " Initialize plugin system
 59 call plug#end()
 60 nnoremap <leader>n :NERDTreeFocus<CR>
 61 nnoremap <leader>n :NERDTreeFocus<CR>
 62 nnoremap <C-n> :NERDTree<CR>
 63 nnoremap <C-t> :NERDTreeToggle<CR>
 64 nnoremap <C-f> :NERDTreeFind<CR>
 65 nmap ss <Plug>(easymotion-s2)
 66 "tagbar
 67 nnoremap <leader>t :TagbarToggle<CR>
 68 " nerdtree settings
 69 
 70 nnoremap <leader>v :NERDTreeFind<cr>
 71 
 72 nnoremap <leader>g :NERDTreeToggle<cr>
 73 
 74 " set width
 75 
 76 let NERDTreeWinSize=31
 77 
 78 " show hidden files
 79 
 80 let NERDTreeShowHidden=1
 81 
 82 
 83 let g:interestingWordsRandomiseColors = 1
 84 
 85 
 86 " Use deoplete.
 87 let g:deoplete#enable_at_startup = 1
 88 set completeopt-=preview
