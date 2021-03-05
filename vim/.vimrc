set nocompatible " отключает обратную совместимость с vi
" табы и отступы
set expandtab " замена табов на пробелы
set smarttab " при нажатии таба добавляет кол-во пробелов = shiftwidth
set tabstop=4 " кол-во пробелов в обычном табе
set softtabstop=4 " кол-во пробелов в табе при удалении
set shiftwidth=4
set number " нумерация строк
set foldcolumn=1 " отступ от левого края экрана
syntax on " подсветка синтаксиса
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
Plug 'digitaltoad/vim-pug'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'luochen1990/rainbow'
call plug#end()
" Оформление
colorscheme gruvbox " тема Gruvbox
let g:gruvbox_contrast_dark = 'medium' " можно установить soft, medium или hard
set bg=dark " устанавливает тёмную тему
let g:airline_powerline_fonts = 1 " включить поддержку Powerline шрифтов
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
"
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
inoremap OO <Esc>O
inoremap HH <Esc>i
inoremap LL <Esc>l
" в нормальном режиме
nmap <F2> <Plug>(coc-rename)
nmap <leader>w :w<CR> " сохранить
nmap <leader>n :bn<CR> " следующей буфер
nmap <leader>b :bp<CR> " предыдущий буфер
nmap <leader>d :bd<CR> " удалить текущий буфер
nmap <leader>- :res -2<CR>
nmap <leader>= :res +2<CR>
nmap <leader>o o<Esc>
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>
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
filetype plugin indent on " включает определение типа файла, загрузку...
set encoding=utf-8 " ставит кодировку UTF-8
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
" перемещение между окнами
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" плагин rainbow parentheses
let g:rainbow_active = 1
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
  \ ]
" подсветка голубым выделенной области
highlight Visual cterm=bold ctermbg=Blue ctermfg=NONE
" курсор в режиме вставки для xfce4-terminal
if has("autocmd")
  au InsertEnter * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_BLOCK/TERMINAL_CURSOR_SHAPE_IBEAM/' ~/.config/xfce4/terminal/terminalrc"
  au InsertLeave * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_IBEAM/TERMINAL_CURSOR_SHAPE_BLOCK/' ~/.config/xfce4/terminal/terminalrc"
 au VimLeave * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_IBEAM/TERMINAL_CURSOR_SHAPE_BLOCK/' ~/.config/xfce4/terminal/terminalrc"
endif
" TAB для автоозавершения и выбора
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Задаем собственные функции для назначения имен заголовкам табов
    function! MyTabLine()
        let tabline = ''

" Формируем tabline для каждой вкладки
    for i in range(tabpagenr('$'))
" Подсвечиваем заголовок выбранной в данный момент вкладки.
                if i + 1 == tabpagenr()
                    let tabline .= '%#TabLineSel#'
                else
                    let tabline .= '%#TabLine#'
                endif

                " Устанавливаем номер вкладки
                let tabline .= '%' . (i + 1) . 'T'

                " Получаем имя вкладки
                let tabline .= ' %{MyTabLabel(' . (i + 1) . ')} |'
            endfor
" Формируем tabline для каждой вкладки <--

" Заполняем лишнее пространство
        let tabline .= '%#TabLineFill#%T'

" Выровненная по правому краю кнопка закрытия вкладки
        if tabpagenr('$') > 1
            let tabline .= '%=%#TabLine#%999XX'
        endif

        return tabline
    endfunction

    function! MyTabLabel(n)
        let label = ''
        let buflist = tabpagebuflist(a:n)

        " Имя файла и номер вкладки
            let label = substitute(bufname(buflist[tabpagewinnr(a:n) - 1]), '.*/', '', '')

            if label == ''
                let label = '[No Name]'
            endif

            let label .= ' (' . a:n . ')'

        " Определяем, есть ли во вкладке хотя бы один
        " модифицированный буфер.
            for i in range(len(buflist))
                if getbufvar(buflist[i], "&modified")
                    let label = '[+] ' . label
                    break
                endif
            endfor

return label
endfunction

    function! MyGuiTabLabel()
        return '%{MyTabLabel(' . tabpagenr() . ')}'
    endfunction

    set tabline=%!MyTabLine()
    set guitablabel=%!MyGuiTabLabel()
