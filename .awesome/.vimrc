""""""""""""""""""""""""""""""
" load common config
source ~/.dotfiles/.common/.vimrc

""""""""""""""""""""""""""""""
" awesome config

let g:python3_host_prog = $HOME.'/.virtualenvs/neovim/bin/python'
set runtimepath+=~/.dotfiles/.awesome/.dein/repos/github.com/Shougo/dein.vim
set rtp+=/usr/local/opt/fzf

if dein#load_state('~/.dotfiles/.awesome/.dein')
  call dein#begin('~/.dotfiles/.awesome/.dein')
  call dein#add('~/.dotfiles/.awesome/.dein/repos/github.com/Shougo/dein.vim')

  " navigation
  call dein#add('preservim/nerdtree')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('majutsushi/tagbar')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('kien/ctrlp.vim')
  call dein#add('kshenoy/vim-signature')
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 }) 
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  call dein#add('junegunn/vim-peekaboo')
  call dein#add('severin-lemaignan/vim-minimap')

  " code completion
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-jedi')
  call dein#add('davidhalter/jedi-vim')
  call dein#add('dart-lang/dart-vim-plugin')
  call dein#add('keith/swift.vim')

  " vim-airline
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " code style
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('sbdchd/neoformat')
  call dein#add('tpope/vim-surround')
  call dein#add('MTDL9/vim-log-highlighting')

  " code checker
  call dein#add('neomake/neomake')

  " color schemes
  call dein#add('joshdick/onedark.vim')
  call dein#add('gilgigilgil/anderson.vim')
  call dein#add('wadackel/vim-dogrun')

  " git diff & merge
  call dein#add('tpope/vim-fugitive')
  
  call dein#end()
  call dein#save_state()
endif


""""""""""""""""""""""""""""""
" custom

" highlight current line
set cursorline

" use system clipboard
set clipboard+=unnamedplus

" clear selection 
nnoremap <esc> :noh<return><esc>


""""""""""""""""""""""""""""""
" colorscheme
colorscheme dogrun


"""""""""""""""""""""""""""""""
" NERDTree
" open nerdtree when opening vim without file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""
" tabgar
nmap <C-t> :TagbarToggle<CR>


""""""""""""""""""""""""""""""
" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


""""""""""""""""""""""""""""""
" airline
let g:airline_theme='dark_minimal'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0


""""""""""""""""""""""""""""""
" neoformat 
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1


""""""""""""""""""""""""""""""
" neomake
let g:neomake_python_enabled_makers = ['pycodestyle']
call neomake#configure#automake('nrwi', 500)


""""""""""""""""""""""""""""""
" vim-tmux-navigator config
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
" pane creation using Opt-./,
nnoremap <M-.> :vsp<return><esc>
nnoremap <M-,> :sp<return><esc>


""""""""""""""""""""""""""""""
" CtrlP
let g:ctrlp_show_hidden = 1


""""""""""""""""""""""""""""""
" vim-fugitive
:set diffopt+=vertical


""""""""""""""""""""""""""""""
" fzf
" https://github.com/fisadev/fisa-vim-config

" file finder mapping
nnoremap <leader>e :Files<CR>

" general code finder in current file mapping
nnoremap <leader>f :BLines<CR>

" general code finder in current file mapping with preview
" https://github.com/junegunn/fzf.vim/issues/374
command! -bang -nargs=* BLinesWithPreview
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --color=always --smart-case . '.fnameescape(expand('%')), 1,
    \   fzf#vim#with_preview({'options': '--delimiter : --nth 4.. --no-sort'}, 'right:50%', '?'), 1)
nnoremap <leader>pf :BLinesWithPreview<CR>

" general code finder in all files mapping
nnoremap <leader>F :Lines<CR>

" general code finder in all files mapping with preview
" https://github.com/junegunn/fzf.vim/issues/374
command! -bang -nargs=* LinesWithPreview
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --color=always --smart-case . ', 1,
    \   fzf#vim#with_preview({'options': '--delimiter : --nth 4.. --no-sort'}, 'right:50%', '?'), 1)
nnoremap <leader>pF :LinesWithPreview<CR>

" commands finder mapping
nnoremap <leader>c :Commands<CR>


""""""""""""""""""""""""""""""
" kite
let g:kite_tab_complete=1
set completeopt+=menuone   " show the popup menu even when there is only 1 match
set completeopt+=noinsert  " don't insert any text until user chooses a match
set completeopt-=longest   " don't insert the longest common text
set completeopt+=preview
autocmd CompleteDone * if !pumvisible() | pclose | endif
set belloff+=ctrlg  " if vim beeps during completion
