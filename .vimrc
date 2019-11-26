se nu cc=80 autoread ts=8 sw=8 tw=80 cindent autoindent smartindent mouse=a nocompatible hls
setlocal spell spelllang=en_us

filetype off

imap jk <ESC>
imap <F3> <ESC>:make<CR>
map <F3> :make<CR>
set makeprg=g++\ -Wall\ -Wextra\ -std=c++17\ -g\ -o\ %<\ %
imap <F3> <ESC>:make<CR> map <F3> :make<CR> imap <F7> <ESC>:!g++ -o %< % -std=c++17 -Wall -Wextra -g -O2 -DCLANG -include bits/stdc++.h<CR>
map <F7> :!g++ -o %< % -std=c++17 -Wall -Wextra -g -O2 -DCLANG -include bits/stdc++.h<CR>
imap <F8> <ESC>:!time ./%<<CR>
map <F8> :!time ./%<<CR>
imap <F9> <ESC>:call Gdb()<CR>
map <F9> :call Gdb()<CR> imap <C-b> <ESC>:q<CR>
map <C-b> :q<CR>
imap <F2> <ESC>:vsp %<.in<CR><ESC>:sp %<.out<CR><ESC>
map <F2> :vsp %<.in<CR><ESC>:sp %<.out<CR><ESC>
command -nargs=1 Nav call Nav(<q-args>)
command -nargs=1 Sol call Sol(<q-args>)
function Term()
	call term_start("bash",{"term_rows":6,"term_name":"vimshell"})
endfunction

function Gdb()
	call term_start(join(["gdb ",expand("%:p:r")]),{"term_rows":6,"term_name":"Debug"})
endfunction

function Nav(problem)
	call term_start(join(["w3m https://www.luogu.org/problem/",a:problem],""),{"vertical":1,"term_cols":35})
endfunction

function Sol(problem)
	call term_start(join(["w3m https://www.luogu.org/problemnew/solution/",a:problem],""),{"vertical":1,"term_cols":35})
endfunction

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Rip-Rip/clang_complete'
Plugin 'SuperTab'
"Plugin 'NLKNguyen/papercolor-theme'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'sheerun/vim-polyglot'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'w0rp/ale'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'reedes/vim-pencil'
call vundle#end()            " required
filetype plugin indent on    " required
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
let g:clang_complete_auto=1     " automatically complete after -> . ::
let g:clang_use_library=1
let g:clang_library_path='/usr/lib/llvm-7/lib/'
set completeopt=menu
let g:rainbow_active=1
let g:airline_powerline_fonts=0
"how powerful ale is!
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\}
imap <C-d> <ESC><Plug>(ale_go_to_definition_in_split)
map <C-d> <Plug>(ale_go_to_definition_in_split)
syn on
color mac_classic
if has("gui_running")
	se go=
	se gfn=Cascadia\ Code\ 12
	set guicursor=n-v-c-i-ci-r-cr-sm:block-Cursor
endif
