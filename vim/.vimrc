set nocompatible " отключает обратную совместимость с vi
" табы и отступы
set expandtab " замена табов на пробелы
set smarttab " при нажатии таба добавляет кол-во пробелов = shiftwidth
set tabstop=4 " кол-во пробелов в обычном табе
set softtabstop=4 " кол-во пробелов в табе при удалении
set shiftwidth=4
set number " нумерация строк
set foldcolumn=1 " отступ от левого края экрана
" Плагины
call plug#begin('~/.vim/bundle')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'lyokha/vim-xkbswitch'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mitermayer/vim-prettier'
Plug 'digitaltoad/vim-pug', { 'for': 'pug' }
Plug 'dNitro/vim-pug-complete', { 'for': ['jade', 'pug'] }
Plug 'othree/html5.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'jparise/vim-graphql'
Plug 'neoclide/coc-eslint'
Plug 'neoclide/coc-prettier'
if exists(':terminal')
    if has('nvim-0.4.0') || has('patch-8.2.191')
        Plug 'chengzeyi/multiterm.vim'
    endif
endif
call plug#end()
" Оформление
colorscheme gruvbox " тема Gruvbox
let g:gruvbox_contrast_dark = 'medium' " soft, medium или hard
set bg=dark " dark или light
let g:airline_powerline_fonts = 1 " поддержка Powerline шрифтов
let g:airline#extensions#keymap#enabled = 0 " не показывать текущий маппинг
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" " кастомная графа положения курсора
let g:Powerline_symbols='unicode' " поддержка unicode
let g:airline#extensions#xkblayout#enabled = 0
set guifont=Fura\ Code\ Light\ Nerd\ Font\ Complete:h16
" отключение звуковых эффектов
set noerrorbells
set novisualbell
" поддержка мыши в v режиме
set mouse=v
" команды клавиатуры
"    nmap - нормальный режим;
"    vmap - визуальный режим;
"    omap - режим, когда выбран оператор действия (y,p или d);
"    cmap - режим командной строки;
"    imap - режим вставки.
"    не рекурсивные варианты: noremap, vnoremap, nnoremap, onoremap, cnoremap и inoremap
let mapleader = "\<SPACE>" " 'пробел' - лидер
" в режиме вставки
inoremap jj <ESC>
inoremap оо <ESC>
inoremap II <Esc>I
inoremap AA <Esc>A
inoremap OO <cr><Esc>O
inoremap HH <Esc>i
inoremap LL <Esc>l
" в нормальном режиме
nmap <F2> <Plug>(coc-rename)
nmap <leader>w :w<CR> " сохранение
nmap <leader>n :bn<CR> " следующей буфер
nmap <leader>b :bp<CR> " предыдущий буфер
nmap <leader>d :bw<CR> " удаление текущего буфера
nnoremap . :<C-u>execute "norm! " . repeat(".", v:count1)<CR> " N. - повторение . N раз
" nmap <leader>a :%bd|e#<CR> " закрытие всех буферов, кроме текущего
nmap <leader>- :res -2<CR>
nmap <leader>= :res +2<CR>
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p> " обновление NERDTree
nmap <Leader>y y$<CR> " копирование от курсора и до конца строки
nmap <Leader>m 50%<CR> " на середину файла
nmap <Leader>g bvEUe " слово в верхнем регистре
nnoremap <Leader>t "=strftime("%c")<CR>P " текущие время и дата
nmap j gj
nmap k gk
vmap j gj
vmap k gk
" работа с буфером обмена
inoremap <C-v> <ESC> "+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d
" поиск
set ignorecase " игнорирование регистра при поиске
set smartcase
set hlsearch " подсветка при поиске
set incsearch " первое совпадение при поиске
" полезное
syntax on " подсветка синтаксиса
syntax enable
filetype plugin indent on " включает определение типа файла, загрузку...
set encoding=utf-8 " кодировка UTF-8
set guioptions= " отключаем панели прокрутки в GUI
set showtabline=0 " отключаем панель табов
set number relativenumber " нумерация строк относительно курсора
set wrap linebreak nolist " перенос строк по словам
set textwidth=120 " ширина строки
set showmatch " переключение с закрывающей скобки на открывающую и обратно
set cursorline " подсветка строк
set backspace=indent,eol,start
set lbr
set noswapfile
set nobackup
set nowb
set hidden " можно переключиться в другой буфер без записи изменений
set scrolloff=5 " оставляет 5 строчек до и после курсора при прокрутке
set title titlestring=
nnoremap <CR> :noh<CR><CR>  " убирает подсветку после поиска
set matchpairs+=<:> " % для перемещения
highlight Comment cterm=italic " шрифт италик для комментирования
" автоматически удаляет пустые строки в конце файла при сохранении
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e
set splitbelow splitright " открытие новых окон справа  и внизу
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " отключение комментирования следующей строки
" Курсор на том же самом месте
au BufWinLeave * mkview
au BufWinEnter * silent loadview
" перемещение между окнами
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" выделение * и замена всех совпадений
nnoremap <Leader>s :%s///g<Left><Left>
nnoremap <Leader>sc :%s///gc<Left><Left><Left>
" выделение * и замена всех совпадений выделенной области
xnoremap <Leader>s :s///g<Left><Left>
xnoremap <Leader>sc :s///gc<Left><Left><Left>
" абсолютные номера строк в командном режиме
au CmdLineEnter * set norelativenumber | redraw
au CmdlineLeave * set relativenumber
" сохранение истории изменений
set history=64
set undolevels=128
set undodir=~/.vim/undodir/
set undofile
set undolevels=1000
set undoreload=10000
" плагин xkb-switch
let g:XkbSwitchEnabled = 1
" плагин NERDTreeToggle
map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeIgnore = ['^node_modules$']
" плагин Multiterm
nmap <F12> <Plug>(Multiterm)
tmap <F12> <Plug>(Multiterm)
imap <F12> <Plug>(Multiterm)
xmap <F12> <Plug>(Multiterm)
if !exists('g:multiterm_opts')
    let g:multiterm_opts = {}
endif
let g:multiterm_opts.height = '30'
" интеграция git в NERDTree
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
" значки для gitgutter
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'
" проверка орфографии
map <C-F8> :setlocal spell spelllang=en<CR>i
map <S-F8> :setlocal spell spelllang=ru<CR>i
map <F8> :setlocal nospell<CR>i
highlight clear SpellBad
highlight SpellBad ctermfg=Red
highlight clear SpellCap
highlight SpellCap ctermfg=Blue
highlight clear SpellLocal
highlight SpellLocal ctermfg=Green
" source vimrc после сохранения
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc,mappings.vim source %
augroup END
" динамическая настройка i3config
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end
" плагин Prettier
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css
" плагин COC
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-styled-components',
  \ 'coc-html',
  \ 'coc-tailwindcss',
  \ ]
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif
nnoremap <silent> K :call CocAction('doHover')<CR>
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>f   :CocCommand prettier.formatFile<CR>
xmap <leader>dx  <Plug>(coc-convert-snippet) " создаёт сниппет выделенной области
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" подсветка голубым выделенной области
highlight Visual cterm=bold ctermbg=Blue ctermfg=NONE
" курсор в режиме вставки для xfce4-terminal
if has("autocmd")
  au InsertEnter * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_BLOCK/TERMINAL_CURSOR_SHAPE_IBEAM/' ~/.config/xfce4/terminal/terminalrc"
  au InsertLeave * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_IBEAM/TERMINAL_CURSOR_SHAPE_BLOCK/' ~/.config/xfce4/terminal/terminalrc"
 au VimLeave * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_IBEAM/TERMINAL_CURSOR_SHAPE_BLOCK/' ~/.config/xfce4/terminal/terminalrc"
endif
" курсор в режиме вставки для kitty
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
" TAB для автозавершения и выбора
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
" плагин fugitive
nnoremap <leader>gj :diffget //3<CR>
nnoremap <leader>gc :G commit<CR>
nnoremap <leader>gp :G push origin master<CR>
nnoremap <leader>gpl :G pull origin master<CR>
nnoremap <leader>ga :G add .<CR>
" nnoremap <leader>gc :GBranches<CR>
" nnoremap <leader>ga :Git fetch --all<CR>
" nnoremap <leader>grum :Git rebase upstream/master<CR>
" nnoremap <leader>grom :Git rebase origin/master<CR>
" подсветка typescript
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
hi tsxTagName guifg=#E06C75
hi tsxComponentName guifg=#E06C75
hi tsxCloseComponentName guifg=#E06C75
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575
hi tsxAttrib guifg=#F8BD7F cterm=italic
hi tsxTypeBraces guifg=#999999
hi tsxTypes guifg=#666666
" включение и отключение подстветки
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
