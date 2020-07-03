set nocompatible " 不兼容vi

" 右键不能粘贴问题
if has('mouse')
    set mouse-=a
endif

"--命令行设置--
set showcmd " 命令行显示输入的命令
set showmode " 命令行显示vim当前模式

"语法高亮
syntax enable
syntax on

" 获取当前目录
func GetPWD()
    return substitute(getcwd(), "", "", "g")
endf

" 文件编码模式指定utf
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" 设置不产生swp文件
set nobackup
set autochdir "自动切换到文件当前目录

" 字体配置
set guifont=Consolas:h17

" 总显示最后一个窗口的状态行；设为1则窗口数多于一个的时候显示最后一个窗口的状态行；0不显示最后一个窗口的状态行
set laststatus=2

set backspace=2 " 设置退格键可用

" 保留历史记录
set history=400

" 命令行于状态行
set ch=1
set stl=\ [File]\ %F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w\ \ [PWD]\ %r%{GetPWD()}%h\ %=\ [Line]\ %l,%c\ %=\ %P
set ls=2 " 始终显示状态行

" 制表符
set tabstop=4
set expandtab " 把tab转成空格
set smarttab
set shiftwidth=4
set softtabstop=4

" 状态栏显示目前所执行的指令
set showcmd

" 行控制
set linebreak
set nocompatible
set textwidth=80
set wrap

" 行号和标尺
set number
set ruler
set rulerformat=%15(%c%V\ %p%%%)

" 插入模式下使用 <BS>、<Del> <C-W> <C-U>
set backspace=indent,eol,start

" 缩进 智能对齐方式
set autoindent
set smartindent

"在查找时忽略大小写
set ignorecase
set incsearch
set hlsearch

"设置命令行的高度
set cmdheight=2

"置粘贴模式，这样粘贴过来的程序代码就不会错位了。
set paste

"取得光标处的匹配
function! GetPatternAtCursor(pat)
    let col = col('.') - 1
    let line = getline('.')
    let ebeg = -1
    let cont = match(line, a:pat, 0)
    while (ebeg >= 0 || (0 <= cont) && (cont <= col))
        let contn = matchend(line, a:pat, cont)
        if (cont <= col) && (col < contn)
            let ebeg = match(line, a:pat, cont)
            let elen = contn - ebeg
            break
        else
            let cont = match(line, a:pat, contn)
        endif
    endwh
    if ebeg >= 0
        return strpart(line, ebeg, elen)
    else
        return ""
    endif
endfunction


" 启用插件
filetype on
filetype plugin on

" taglist setting
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口
let Tlist_Process_File_Always=1 "实时更新tags
let Tlist_Inc_Winwidth=0

" nerdtree setting
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=25
let g:NERDTreeShowLineNumbers=1
let g:neocomplcache_enable_at_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""快捷键设置""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F4> :TlistToggle<CR>
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
