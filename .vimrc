set showmode
set laststatus=2
set number
set iskeyword+=-,.,:,/

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent

set dictionary+=vim_pods.dict,vim_proxies.dict,vim_find.dict,vim_cont.dict
set foldenable
set foldmethod=indent
set filetype=on
set syntax=on
set cursorline
set noswapfile
set noerrorbells
set scrolloff=10
set showcmd
set showmatch
set t_vb=
set ignorecase 
set smartcase
syntax on
source syntax.vim
set noswapfile

"  PCOM project command file
au BufRead,BufNewFile *.pcom set filetype=pcom
highlight Words ctermfg=LightBlue
highlight TitleA1 ctermfg=Green
highlight Comment1 ctermfg=DarkGray

"  changing selection color to see the text
highlight Visual ctermfg=white ctermbg=darkblue


function! Test()
    let a = getline('.')
    "  removing tabs
    let b = system('echo "'. a .'" | sed "s/^[ \t]*//"')
    let c = split(b,'#')

    execute "terminal ".c[0]
endfunction

noremap rr <Esc>:source .vimrc<CR>

noremap jj <Esc>Vy:terminal<C-r>"
noremap kk <Esc>Vy:!<C-r>";read -p "wait"
noremap tt :call Test()<CR>

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.

noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

function! ExecuteVisualSelection()
  " Get visual selection lines
  let l:start = getpos("'<")[1]
  let l:end = getpos("'>")[1]
  let l:lines = getline(l:start, l:end)

  " Join them into a single string
  let l:cmd = join(l:lines, "\n")
  " Execute each line
  for line in split(l:cmd, "\n")
    l:line2 = system('sed(line, "s/ //g")') 
    execute line2
  endfor
endfunction

vnoremap xx :<C-u>call ExecuteVisualSelection()<CR>
