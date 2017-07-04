set modelines=1
" Section uisetup {{{

colorscheme badwolf
syntax enable
set number
set showcmd
set lazyredraw
set cursorline

filetype indent on      " load filetype-specific indent file
nnoremap gV `[v`]
" }}}
" Section basicux {{{
:let mapleader = "-"
set wildmode=longest,list,full
set wildmenu
set clipboard=unnamedplus
set autowrite
nnoremap j gj
nnoremap k gk
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
set tabstop=4
set softtabstop=4
set expandtab
" }}}
" Section folding {{{
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
" }}}
" Section searching {{{
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" }}}
" Section pluginsToLoad {{{
call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'rking/ag.vim'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()
" }}}
" Section silversurfer&ctrlp {{{
nnoremap <leader>a :Ag
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" }}}
" Section golang {{{
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"

autocmd FileType go nmap <leader>t  <Plug>(go-test)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
	let l:file = expand('%')
	if l:file =~# '^\f\+_test\.go$'
		call go#cmd#Test(0, 1)
	elseif l:file =~# '^\f\+\.go$'
		call go#cmd#Build(0)
	endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
" }}}
" Section backups {{{
" Backups should end up in ~/.vim-tmp
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}
"
" vim:foldmethod=marker:foldlevel=0
