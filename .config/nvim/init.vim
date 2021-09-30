"          _
" __   __ (_)  _ __ ___    _ __    ___
" \ \ / / | | | '_ ` _ \  | '__|  / __|
"  \ V /  | | | | | | | | | |    | (__
"   \_/   |_| |_| |_| |_| |_|     \___|
"
"
let mapleader =","

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'kovetskiy/sxhkd-vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'nathangrigg/vim-beancount'
Plug 'dylanaraps/wal.vim'
Plug 'lervag/vimtex'
Plug 'ap/vim-css-color'
Plug 'vim-scripts/loremipsum'
Plug 'jceb/vim-orgmode'
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/utl.vim'
Plug 'rhysd/vim-grammarous'
Plug 'preservim/tagbar'
Plug 'bfrg/vim-cpp-modern'
call plug#end()

" When 'ignorecase' and 'smartcase' are both on,
" if a pattern contains an uppercase letter,
" it is case sensitive, otherwise, it is not.
" For example, /The would find only "The",
" while /the would find "the" or "The" etc.
set ignorecase
set smartcase
" assumes set ignorecase smartcase
"augroup dynamic_smartcase
"    autocmd!
"    autocmd CmdLineEnter : set smartcase
"    autocmd CmdLineLeave : set smartcase
"augroup END
" The rest...
set bg=light
set go=a
set mouse=a
set hlsearch
set clipboard+=unnamedplus
" this setting should avoid the line endings issue
" when write shell scripts
set ff=unix
set autochdir
" set textwidth=79

" Some basics:
	" set background=dark    " Setting dark mode
	" colorscheme gruvbox
	colorscheme wal
	nnoremap c "_c
	inoremap <C-space> <Nop>
	set nocompatible
	filetype plugin on
	syntax on
	set path=/home/gregw/.config,/home/gregw/.local/bin,$SYNC_DIR
	set encoding=utf-8
	set number relativenumber
" Enable autocompletion:
	filetype plugin on
	set omnifunc=syntaxcomplete#Complete
	set wildmenu
	set wildignorecase
	set wildmode=longest,list,full
	" Don't offer to open certain files/directories
	set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
	set wildignore+=*.psd,*.bst,*.cls
	set wildignore+=R/x86_64-pc-linux-gnu-library/*

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_ca \| hi SpellBad cterm=underline ctermfg=yellow<CR>
" Grammar-check
	nmap <C-n> <Plug>(grammarous-move-to-next-error)
	nmap <C-p> <Plug>(grammarous-move-to-previous-error)
	nmap <C-c> <Plug>(grammarous-fixit)
	nmap <C-x> <Plug>(grammarous-remove-error)
	nmap <C-q> <Plug>(grammarous-disable-rule)
	let g:grammarous#disabled_rules = {
		\ 'tex' : ['COMMA_PARENTHESIS_WHITESPACE','WORD_CONTAINS_UNDERSCORE', 'CURRENCY', 'NON_STANDARD_WORD','UNIT_SPACE','ARROWS'],
		\ }

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Nerd tree
	map <leader>n :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Tagbar
	nnoremap <silent> <C-t> :TagbarToggle<CR>
	let g:tagbar_left = 1
	let g:tagbar_show_visibility = 1
	let g:tagbar_foldlevel = 1
	let g:tagbar_show_linenumbers = 2
        let g:tagbar_iconchars = ['▸', '▾']
        "let g:tagbar_iconchars = ['', '']
	let g:tagbar_width = max([50, winwidth(0) / 4])

" fzf configurations
	command! -bang MyFZFef call fzf#run(fzf#wrap({ 'source': 'du -a --exclude="*debris" --exclude="*cache" --exclude="*config/R*" --exclude="*config/Brave*" --exclude="*config/GIMP*" --exclude="*config/calcurse*" --exclude="*libreoffice*" --exclude="*syncthing*" --exclude="*firedrake*" --exclude="*pdf*" --exclude="*watch_later*" --exclude="*playlists*" --exclude="*menus*" --exclude="*djvu*" --exclude="*site-packages*" --exclude="*petsc*" --exclude="*virtualenv*" --exclude="*plugged*" --exclude="*Trash*" --exclude="*pyenv*" --exclude="*jupyter*" --exclude="*mozilla*" --exclude="*.git*" ~/Projects ~/.config ~/.local/bin ~/Documents/edu/self | cut -f 2', 'sink': 'e'}, <bang>0))
	map <C-f> :MyFZFef<Cr>
	map <C-b> :Buffers<Cr>
	"map <C-c> :Files<Cr>
	let g:fzf_layout = { 'down': '40%' }
	let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Source init.vim (serves as reload):
	map <leader>S :w! \| source $VIM_DIR/init.vim<CR>
	map <leader>r :w! \| edit %<Tab><CR>

" Replace all is aliased to S.
	nnoremap S :%s//gc<Left><Left><Left>
	nnoremap <C-s> :s//gc<Left><Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
	" map <leader>c :w! \| !compiler <c-r>%<CR>
	map <leader>m :w! \| !maker<CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Ensure files are read as what I want:
	autocmd FileType markdown setlocal conceallevel=2
	"let g:vim_markdown_math = 1
	let g:vim_markdown_folding_level = 6
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	map <leader>V :VimwikiIndex
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost files,directories !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
" Update binds when sxhkdrc is updated.
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif
"
" Git Gutter
	highlight GitGutterAdd ctermfg=Green
	highlight GitGutterChange ctermfg=Yellow
	highlight GitGutterDelete ctermfg=Red
	nmap ) <Plug>(GitGutterNextHunk)
	nmap ( <Plug>(GitGutterPrevHunk)
	let g:gitgutter_enabled = 1
	let g:gitgutter_map_keys = 0

" Floatterm
	let g:floaterm_keymap_new = '<leader>W'
	let g:floaterm_keymap_toggle = '<leader>w'
	let g:floaterm_wintype = 'float'
	let g:floaterm_position = 'bottom'
	let g:floaterm_width = 0.8
	let g:floaterm_height = 0.3
	" Set floaterm window's background to black
	hi Floaterm guibg=black
	" Set floating window border line color to cyan, and background to orange
	hi FloatermBorder guibg=orange guifg=cyan
	hi Search cterm=NONE ctermfg=black ctermbg=yellow
	hi IncSearch cterm=NONE ctermfg=black ctermbg=blue

" Debugger
	let g:termdebug_wide=1
	highlight debugBreakpoint ctermfg=Black ctermbg=Red
	highlight debugBreakpoint ctermfg=Black ctermbg=Red
	highlight debugPC ctermbg=Black
" Source the termdebug plugin
	packadd termdebug
" Add mapping to load termdebug
	noremap <silent> <leader>tt :Termdebug<cr>
	noremap <silent> <leader>dd :Gdb<cr>

" Coc.nvim configuration
	"source $VIM_DIR/plugin/cocconfig.vim

" snippets
	source $VIM_DIR/plugin/snippets.vim
