if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:ale_disable_lsp = 1

call plug#begin('~/.vim/plugged')

" Git
Plug 'tpope/vim-fugitive'

" Software capslock
Plug 'tpope/vim-capslock'

" Heroku
Plug 'tpope/vim-heroku'

" Asynchronous build and test dispatcher
Plug 'tpope/vim-dispatch'

" Comment
Plug 'tpope/vim-commentary'



Plug 'ervandew/supertab'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Automatically save files
Plug '907th/vim-auto-save'


" Plug 'wincent/terminus'
Plug 'wincent/ferret'
Plug 'wincent/loupe'

"Fuzzy Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


Plug 'mattn/emmet-vim'

" Lightline
Plug 'itchyny/lightline.vim'

" Git  branch name
Plug 'itchyny/vim-gitbranch'

" Lightline ALE
Plug 'maximbaz/lightline-ale'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

"Nerdtree
Plug 'preservim/nerdtree' |
			\ Plug 'Xuyuanp/nerdtree-git-plugin' |
			\ Plug 'ryanoasis/vim-devicons' |
			\ Plug 'tiagofumo/vim-nerdtree-syntax-highlight' |
			\ Plug 'scrooloose/nerdtree-project-plugin' |
			\ Plug 'PhilRunninger/nerdtree-visual-selection' |
			\ Plug 'jistr/vim-nerdtree-tabs'

"Tagbar
Plug 'preservim/tagbar'

"Vim Wheel
Plug 'preservim/vim-wheel'

"Word chipper
Plug 'preservim/vim-wordchipper'

"Nerd Commenter
Plug 'preservim/nerdcommenter'

Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'

Plug 'yegappan/grep'
Plug 'yegappan/taglist'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'gregsexton/gitv'



" Code folding
Plug 'tmhedberg/SimpylFold'

" Wakatime
Plug 'wakatime/vim-wakatime'

" Rainbow Parentheses
Plug 'frazrepo/vim-rainbow'



call plug#end()


set updatetime=400

" Autosave settings
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1  " disable auto-save notification
let g:auto_save_events = ["InsertLeave", "TextChanged", "CompleteDone"]


"Disable swap files
set noswapfile


" Setting horizontal and vertical splits
set splitbelow
set splitright


" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Setting up indendation

au BufNewFile, BufRead *.py
			\ set tabstop=4 |
			\ set softtabstop=4 |
			\ set shiftwidth=4 |
			\ set textwidth=79 |
			\ set expandtab |
			\ set autoindent |
			\ set fileformat=unix

au BufNewFile, BufRead *.js, *.html, *.css
			\ set tabstop=2 |
			\ set softtabstop=2 |
			\ set shiftwidth=2


" Omnicompletion
set omnifunc=syntaxcomplete#Complete


" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100


" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h, set fileformat=unix


" Set the default file encoding to UTF-8:
set encoding=utf-8


" Keep indentation level from previous line:
set autoindent


" Make backspaces more powerfull
set backspace=indent,eol,start


" Enable folding
set foldmethod=indent
set foldlevel=99

" Simply fold
let g:SimpylFold_docstring_preview = 1

" Enable folding with the spacebar
nnoremap <space> za

"Folding based on indentation: python
autocmd FileType python set foldmethod=indent


" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=darkred


" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/


" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


" Syntax highlight for python
autocmd BufRead,BufNewFile *.py let python_highlight_all=1
syntax on


" Nerd tree settings
map , :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Nerdtree Git Plugin Config
let g:NERDTreeGitStatusIndicatorMapCustom = {
			\ 'Modified'  :'✹',
			\ 'Staged'    :'✚',
			\ 'Untracked' :'✭',
			\ 'Renamed'   :'➜',
			\ 'Unmerged'  :'═',
			\ 'Deleted'   :'✖',
			\ 'Dirty'     :'✗',
			\ 'Ignored'   :'☒',
			\ 'Clean'     :'✔︎',
			\ 'Unknown'   :'?',
			\ }


" Setting up line numbering
set nu


" Rainbow bracket settings
let g:rainbow_active = 1


" Tagbar Config
nmap <F8> :TagbarToggle<CR>


set shell=sh
set clipboard=unnamed
map ; :Files<CR>
set statusline+=%{FugitiveStatusline()}


" Lightline
function! CocCurrentFunction()
	return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
			\ 'colorscheme': 'darcula',
			\ 'component_expand' : { 'linter_checking': 'lightline#ale#checking',
			\  'linter_infos': 'lightline#ale#infos',
			\  'linter_warnings': 'lightline#ale#warnings',
			\  'linter_errors': 'lightline#ale#errors',
			\  'linter_ok': 'lightline#ale#ok'},
			\'component_type':     {    'linter_checking': 'right',
			\     'linter_infos': 'right',
			\     'linter_warnings': 'warning',
			\     'linter_errors': 'error',
			\     'linter_ok': 'right'},
			\ 'active': {
				\   'left': [ [ 'mode', 'paste' ],
				\             [ 'gitbranch', 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ],
				\ 'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
				\            [ 'lineinfo' ],
				\            [ 'percent' ],
				\            [  'filetype'] ],
				\ },
				\ 'component_function': {
					\   'gitbranch': 'gitbranch#name',
					\   'cocstatus': 'coc#status',
					\   'currentfunction': 'CocCurrentFunction'
					\ },
					\ }

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"


"Ale
let g:ale_linters = {'python': ['flake8']} "'mypy', 'pydocstyle','pyflakes', 'bandit',
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'],
                        \'python':['black']}
let g:ale_fix_on_save = 1
let g:ale_completion_autoimport = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Omnicomplete Ale
set omnifunc=ale#completion#OmniFunc

" Ale auto import
let g:ale_completion_autoimport = 1

" Coc
inoremap <silent><expr> <c-space> coc#refresh()

"Git Gutter Config
nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk

function! GitStatus()
	let [a,m,r] = GitGutterGetHunkSummary()
	return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}


" Emmet
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key=','
autocmd FileType html,css EmmetInstall


" Shortcuts

" map CTRL-E to end-of-line (insert mode)
imap <C-e> <esc>$i<right>

" map CTRL-A to beginning-of-line (insert mode)
imap <C-a> <esc>0i

" CTRL-C to copy (visual mode)
vmap <C-c> y

" CTRL-X to cut (visual mode)
vmap <C-x> x

" CTRL-V to paste (insert mode)
imap <C-v> <esc>P

" Commit and push
nnoremap <silent> /<space> :G commit -am updated <bar> :G push<CR>





packloadall
silent! helptags ALL
