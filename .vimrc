"___________________________________STARTUP___________________________________{{{

"start my plugin manager for vim. Don't worry, its not a virus, I swear...
execute pathogen#infect()

"increase timeout for syntax highlighting, to allow large file highlighting
set rdt=10000

" }}}
"_______________________________TABS_AND_SPACES_______________________________{{{

"short for noexpandtab, copyindent, preserveindent, softtabstop=0, shiftwidth=4, tabstop=4
set noet ci pi sts=0 sw=4 ts=4

" }}}
"___________________________________COLOURS___________________________________{{{

"custom colours, get it at https://github.com/altercation/vim-colors-solarized
try
	filetype plugin indent on
	syntax enable
	let g:solarized_termcolors=16
	colorscheme solarized
	set background=dark
catch
endtry

" }}}
"__________________________________UI_CONFIG__________________________________{{{

" Lines
set number

"gives numbering relative to your cursor. 
"both number and relativenumber makes current line absolute, rest relative
"set relativenumber			"THIS HAS BEEN DISABLED FOR PERFORMANCE

" gives pretty colours for coding
syntax on

" show position in file
set ruler

"highlight current line and highlight line number on ruler
"set cul		"THIS HAS BEEN DISABLED FOR PERFORMANCE

" show matching bracket when cursor is on the bracket
set showmatch

" how often brackets should blink (in tenths of a second)
set mat=2

"visually wrap lines
set wrap

"show current command being typed on the bottom left of the screen
set showcmd

"shows the current filename above the statusbar
set laststatus=2

" }}}
"___________________________________SEARCH?___________________________________{{{

" make searches ignore case
set ignorecase

" switch on smartcase (only works when ignorecase is on)
set smartcase

" Jump Cursor while typing search
set incsearch

" Highlight search matches
set hlsearch

"type leader / for 
"very magic mode, global replace, ask for confirmation
"and positions cursor so you type search/replace

"* and # will now jump you back to the word you started it on, and center screen.

"next search and previous search center screen after jumps

" }}}
"___________________________________FOLDING___________________________________{{{

"please note that: fold / unfold is mapped to <LEADER>f 
"global version of fold / unfold is mapped to <LEADER>F

"switches on folding
set foldenable

"will open the first 10 nests of folds automatically
set foldlevelstart=10

"make the maximum fold nexting 10, need more? Set it for the file youre in!
set foldnestmax=10

"folds are based off indentation
set foldmethod=indent

" }}}
"__________________________________MOVEMENTS__________________________________{{{

" return to last edit position when opening files (you want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" }}}
"___________________________________LEADER!___________________________________{{{

nnoremap <Space> <Nop>
let mapleader="\<Space>"

" }}}
"_________________________________KEY_MAPPING_________________________________{{{

"imap is insertmode map, nmap is normalmode map vmap is visualmap etc
"map is recursive (map x y map y x will endless loop because of this)
"noremap is nonrecursive

"____________________________________IMAPS____________________________________{{{ 

" use jk in insert mode to exit insert mode (replaces escape)
imap jk <Esc>

":TAC toggles auto complete on off
let s:AutoCompleteToggleMapping=1

command! TAC call ToggleMappings()

function! ToggleMappings()
    if s:AutoCompleteToggleMapping
		"MAPPING ON
		"if statements
		imap if<TAB> if<SPACE>()<SPACE>{<CR>}<ESC>k$ba

		"else statement
		imap else<TAB> else<SPACE>{<CR>}<ESC>kA<CR>

		"elseif statement
		imap elseif<TAB> elseif<SPACE>()<SPACE>{<CR>}<ESC>k$ba
		imap elsif<TAB> elseif<SPACE>()<SPACE>{<CR>}<ESC>k$ba

		"for loop
		imap for<TAB> for<SPACE>()<SPACE>{<CR>}<ESC>k$ba

		"foreach loop
		imap foreach<TAB> foreach<SPACE>()<SPACE>{<CR>}<ESC>k$ba
		imap foreac<TAB> foreach<SPACE>()<SPACE>{<CR>}<ESC>k$ba
		imap forea<TAB> foreach<SPACE>()<SPACE>{<CR>}<ESC>k$ba
		imap fore<TAB> foreach<SPACE>()<SPACE>{<CR>}<ESC>k$ba

		"while loop
		imap while<TAB> while<SPACE>()<SPACE>{<CR>}<ESC>k$ba

		"funcitons
		imap func<TAB> function<SPACE>()<SPACE>{<CR>}<ESC>k$bi

		"error_log
		imap error_log<TAB> error_log("");<ESC>hhi
		imap error<TAB> error_log("");<ESC>hhi
		imap err<TAB> error_log("");<ESC>hhi
		imap er<TAB> error_log("");<ESC>hhi
		
		"console.log
		imap console<TAB> console.log("");<ESC>hhi
		imap cons<TAB> console.log("");<ESC>hhi
		imap con<TAB> console.log("");<ESC>hhi

		echo "AC ON!"
    else
		"MAPPING OFF
        iunmap if<TAB>
		iunmap else<TAB>
		iunmap elseif<TAB>
		iunmap elsif<TAB>
		iunmap for<TAB>
		iunmap foreach<TAB>
		iunmap foreac<TAB>
		iunmap forea<TAB>
		iunmap fore<TAB>
		iunmap while<TAB>
		iunmap func<TAB>
		iunmap error_log<TAB>
		iunmap error<TAB>
		iunmap err<TAB>
		iunmap er<TAB>
		iunmap console<TAB>
		iunmap cons<TAB>
		iunmap con<TAB>
		echo "AC OFF!"
    endif

    let s:AutoCompleteToggleMapping = !s:AutoCompleteToggleMapping
endfunction

"call it so its enabled by default, silent so it it doesnt prompt
silent TAC

"}}}




" Enter key inserts newline after current line without entering insert mode
nnoremap <CR> o<Esc>

" LEADER KEY + ENTER does same as ENTER but inserts line before current line
nnoremap <LEADER><CR> O<Esc>

"swap the 0 and ^ keys (0 takes you to start of line after indents
nnoremap 0 ^
nnoremap ^ 0
vnoremap 0 ^
vnoremap ^ 0
nnoremap d0 d^
nnoremap d^ d0

" :W sudo saves file even if opened in non sudo. It's practically magic
" the exclamation mark on command prevents 'e174 Command already exists:'
" when reloading the vimrc using :so % (:source (from this file))
command! W w !sudo tee % > /dev/null

" Toggle case sensitivity in searches on and off with \c
map \c :set ignorecase!<CR>:set ignorecase?<CR>

" Toggle smartcase in searches on and off with \s
map \s :set smartcase!<CR>:set smartcase?<CR>

"open or close folding with <LEADER>f
nnoremap <LEADER>f za

"open all folds with <LEADER>F then center screen with zz
"<expr> use answer of the right hand side evaluation (turnary operator)
nnoremap <expr> <LEADER>F &foldlevel ? 'zMzz' :'zRzz'

"if you're reading this then you've already figured out what these do
"nnoremap <Left> :echoe "NUH UH! Use h"<CR>
"nnoremap <Right> :echoe "NUH UH! Use l"<CR>
"nnoremap <Up> :echoe "NUH UH! Use k"<CR>
"nnoremap <Down> :echoe "NUH UH! Use j"<CR>
"inoremap <Left> <ESC>:echoe "NUH UH! Use h"<CR>la
"inoremap <Right> <ESC>:echoe "NUH UH! Use l"<CR>la
"inoremap <Up> <ESC>:echoe "NUH UH! Use k"<CR>la
"inoremap <Down> <ESC>:echoe "NUH UH! Use j"<CR>la

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

"to prevent accidentally entering insert mode when I miss the o key
nnoremap <LEADER>i :echoe 'WHOOPS! Did you mean LEADER + o ?'<CR>

"change split controls from being CTRL+w+h/j/k/l to <LEADER>+j/k/l/h
nnoremap <LEADER>j <C-W><C-J>
nnoremap <LEADER>k <C-W><C-K>
nnoremap <LEADER>l <C-W><C-L>
nnoremap <LEADER>h <C-W><C-H>
"visual mode versions
vnoremap <LEADER>j <C-W><C-J>
vnoremap <LEADER>k <C-W><C-K>
vnoremap <LEADER>l <C-W><C-L>
vnoremap <LEADER>h <C-W><C-H>

"open a new buffer with <LEADER>O
"why cycle when you can fly?
"https://vi.stackexchange.com/questions/4995/how-does-one-put-currently-open-files-into-tabs
nnoremap <LEADER>O :ls<CR>:b<SPACE>
"i now use <LEADER>o for ctrlPbuffer searching


"cycle tabs with <SPACE><TAB>
nnoremap <LEADER><TAB> gt

"invoke CTRL-P plugin with <LEADER>p instead

"<LEADER>c will change case (swap case) in normal and visual mode respectively.
nnoremap <LEADER>c ~
vnoremap <LEADER>c ~

"save buffers and splits in a session. Reload session with vim -S
"NOTE! when doing so, save all files with :wa or unsaved changes are lost
"exclamation to overwrite existing sessions. This is a quicksave
nnoremap <LEADER>s :mksession!<CR>

"type <LEADER> / for 
"searching recursively through current directory without using autocmd
"(increases search speed)
"without jumping to first match, and open results list
nnoremap <LEADER>/ :noautocmd<SPACE>vimgrep<SPACE>//j<SPACE>**/* \| :copen<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>

"type <LEADER> ? for search accross files
"noautocmd to prevent slow searches (would run autocmds on every search)
"/c to ignore case (/C if you want case matching)
"j flag to prevent it jumping to first match
"** for current directory recursive search
nnoremap <LEADER>? :noautocmd<SPACE>vimgrep<SPACE>/\c/j<SPACE>**<LEFT><LEFT><LEFT><LEFT><LEFT>

"im tired of reaching for shift. Why do in 3 what you can do in 2?
nnoremap ; :

"swap two splits, <leader>q to mark one and <leader>w to mark the other
"set in split tab
"nnoremap <silent> <leader>q :call MarkWindowSwap()<CR>
"nnoremap <silent> <leader>w :call DoWindowSwap()<CR>

"the ctrl j and ctrl k keys will scroll faster, also use capslock instead
"because i remapped it in osx to use caps as another ctrl key
noremap <C-J> 5j
noremap <C-K> 5k

"get rid of search highlighting but not clear search with esc
"map ± :noh<CR>

"when searching, make the new hit be at the center of screen.
nnoremap n nzz
nnoremap N Nzz

"* and # will now jump you back to the word you started it on, and center screen.
nnoremap * *Nzz
nnoremap # #Nzz

"Better yanks
nnoremap Y ^yg_

" For local replace
nnoremap <LEADER>r gd[{V%::s/<C-R>///gc<LEFT><LEFT><LEFT>

" For global replace
nnoremap <LEADER>R gD:%s/<C-R>///gc<LEFT><LEFT><LEFT>

" }}}
"___________________________________BUFFERS___________________________________{{{

"this is very hard to explain in such a short line, look it up.
"without it (which is how standard vim is shipped) it is impossible to switch
"buffers without saving your current buffer or abandoning its changes.
"each buffer is a file
set hidden

"cursor jumps to start of line when switching buffers, this will prevent that
set nostartofline

"save current set of buffers and splits with <LEADER>s and open with vim -S
"NOTE! when doing so, save all files with :wqa or unsaved changes are lost
" }}}
"____________________________________SPLIT____________________________________{{{

"put new splits under current pane, its more intuitive
set splitbelow

"puts new splits right of current pane, also more intuitive
set splitright

"save current set of buffers and splits with <LEADER>s and open with vim -S
"NOTE! when doing so, save all files with :wqa or unsaved changes are lost

"swap two windows by marking one with <leader>q and the other with <leader>w
function! MarkWindowSwap()
	let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
	"Mark destination
	let curNum = winnr()
	let curBuf = bufnr( "%" )
	exe g:markedWinNum . "wincmd w"
	"Switch to source and shuffle dest->source
	let markedBuf = bufnr( "%" )
	"Hide and open so that we aren't prompted and keep history
	exe 'hide buf' curBuf
	"Switch to dest and shuffle source->dest
	exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction

nnoremap <silent> <leader>q :call MarkWindowSwap()<CR>
nnoremap <silent> <leader>w :call DoWindowSwap()<CR>

"if there is a window associated with buffer 1
if bufwinnr(1)
  map + <C-W>+
  map _ <C-W>-
endif

" }}}
"____________________________________SOUND____________________________________{{{

" get rid of dings bings bells and smells
set noerrorbells
set novisualbell
set t_vb=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
	autocmd GUIEnter * seet vb t_vb=
endif

" }}}
"___________________________________PLUGINS___________________________________{{{

"this fold is for managing the settings of any plugins I use

"________________________________YouCompleteMe________________________________{{{

"is a requirement for YouCompleteMe
set encoding=utf-8

" }}}

"____________________________________CtrlP____________________________________{{{

"fuzzy search file browser for vim. Remapped in key_mapping to <LEADER>p
"and <LEADER>o for buffer search

"default start directory when opened is vims directory.
"When you change dir with :cd ctrlp will use that by default
let g:ctrlp_working_path_mode = 0

"change the default mapping and Command to start ctrl-p
let g:ctrlp_map = '<LEADER>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_cmd = 'CtrlP'

"change the default mapping to search through buffers
nnoremap <LEADER>o :CtrlPBuffer<CR>

"always open new files in a new buffer
let g:ctrlp_switch_buffer=0

"put most relevant results on top, least on bottom
let g:ctrlp_match_window = 'bottom,order:ttb'
" }}}

"__________________________________EasyAlign__________________________________{{{

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" }}}

" }}}
"_________________________________STATUS_LINE_________________________________{{{

set statusline=					"clear statusline. append with += in future

set statusline+=buf[%n]			"buf[<buf_number>]
set statusline+=\ \ \ \ %f		"    <shortened_file_path_with_full_file_name>
set statusline+=%=				"pull everything after this to the right
set statusline+=%l\ /\ %L		"<current_line_position> / <max_line_position> 
set statusline+=%10(%P%)		"<percentage_pos_in_file> PADDED_10_SPACES

" }}}
"____________________________________OTHER____________________________________{{{

"removes octal and hex as considerations when (inc/dec)rementing with ctrl-A
set nrformats-=octal
set nrformats-=hex

" }}}
"__________________________________LANGUAGES__________________________________{{{

"_____________________________________PHP_____________________________________{{{

"type :h ft-php-syntax for more info

"if you like SQL sntax highlighting inside Strings
let php_sql_query = 1

"Enable HTML syntax highlighting inside Strings
let php_htmlInStrings = 1

"For Highlighting parent error ] or )
let php_parent_error_close = 1

"For Highlighting parent error ] or )
let php_parent_error_close = 1
" }}}

" }}}
"__________________________________THIS_FILE__________________________________{{{

"the folding for this file is done with the foldmethod=marker modeline
"and is marked with a triple curly bracket

"allows vim to use modelines. These are instructions inside comments
"modelines can only be read near at the top or bottom of the file
set modeline

"modelines are slightly dangerous
"but they are limited to protect you
"sets how many lines from the top or the bottom vim will look for modelines 
set modelines=0 "disabled for safety, rather use autocmd Bufread if possible

"a little explanation about autocmd bufread commands.
"autocmd Bufread [file_to_read] [mode/command] [action]
"autocmd		- automatic command
"Bufread		- triggered once when file is read into memory
"				  or when you reload via :edit!
"[file_to_read]	- replace with the file you want to apply this to
"				  command will trigger ONCE when file is opened
"[mode/command] - normal/visual/insert/setlocal etc
"[action]		  what you want it to do when triggered

"these actions all trigger on my vimrc and work locally

"when opening the buffer

"go into normal mode and press gg (go to top of file)
"other files will go to where last edited as in movements fold
"autocmd BufRead ~/.vimrc normal gg

"fold based off brackets and not indentation
autocmd BufRead ~/.vimrc setlocal foldmethod=marker

"when entering this file

"close all folds
autocmd BufEnter ~/.vimrc normal zM

"then put cursor at center of attention
autocmd BufEnter ~/.vimrc normal zz

" }}}
"_____________________________________END_____________________________________{{{
" below is an example of a modeline. it does nothing now because modelines=0
" vim: foldmethod=marker:foldlevel=0
" }}}

"tip: use 'space + f' to open a section
"
"
