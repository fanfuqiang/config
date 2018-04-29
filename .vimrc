" ----------------------------基 本 配 置--------------------------------------
" 定义快捷键的前缀，即<Leader>
let mapleader=";"
" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" 定义快捷键到行首和行尾
"nmap LB 0
"nmap LE $
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" taglist
map <silent> <F9> :TlistToggle<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
"nnoremap <C-Right> <C-W>l
" 跳转至左方的窗口
"nnoremap <C-Left> <C-W>h
" 跳转至上方的子窗口
"nnoremap <C-Up> <C-W>k
" 跳转至下方的子窗口
"nnoremap <C-Down> <C-W>j
" 打开定义在一个新窗口
"nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>v
" 在一个新tab中打开定义 
"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" Open the definition in a vertical split
nnoremap <silent> <C-\> :vs <CR>:exec("tag ".expand("<cword>"))<CR>
" Open the definition in a horizontal split
nnoremap <silent> <Leader><C-\> :sp <CR>:exec("tag ".expand("<cword>"))<CR>
" Close current split tab`
nnoremap <silent> <C-x> :q <CR>
"" 定义快捷键在结对符之间跳转
nmap <Leader>M %
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
" 设置backspace为删除
set backspace=indent,eol,start
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu
" disable continuation of comment
au FileType * setlocal formatoptions-=c formatoptions-=r
" italic字体注释
highlight Comment cterm=italic
"-------------------------new tab style----------------------------------------
" 设置新窗口在当前窗口的下面和右边
set splitbelow
set splitright
"---------------------------clipboard------------------------------------------
" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

" -----------------------vundle 环境设置---------------------------------------
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
"Plugin 'fanfuqiang/molokai'
Plugin 'vim-scripts/phd'
"Plugin 'Lokaltog/vim-powerline'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'kshenoy/vim-signature'
Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DrawIt'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/ycmd'
Plugin 'rdnetto/YCM-Generator'
Plugin 'derekwyatt/vim-protodef'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'suan/vim-instant-markdown'
"Plugin 'lilydjwg/fcitx.vim'
" 插件列表结束
call vundle#end()
filetype plugin indent on
" ------------------------配 色 与 显 示 方 案--------------------------------
set t_Co=256
set background=dark
"colorscheme solarized
colorscheme molokai
"let g:molokai_original = 1
let g:rehash256=1
"colorscheme phd
"highlight Comment cterm=bold
" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
"------------------------------------------------------------------------------
" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
"fun! ToggleFullscreen()
 "   call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
"endf
" 全屏开/关快捷键
"map <silent> <F11> :call ToggleFullscreen()<CR>
" 启动 vim 时自动全屏
"autocmd VimEnter * call ToggleFullscreen()
" 总是显示状态栏
set laststatus=2
" Always display the tabline, even if there is only one tab
"set showtabline=2
" Hide the default mode text (e.g. -- INSERT -- below the statusline)
"set noshowmode
" 开启相对行号
set relativenumber
" 开启行号显示
set number
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
"set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" 禁止折行
set nowrap
" ----------------------------------TAGLIST------------------------------------
let Tlist_Ctags_Cmd = 'ctags'
" 不同时显示多个文件的tag
let Tlist_Show_One_File = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Exit_OnlyWindow = 1
" ---------------------------状 态 栏 设 置------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" 状态栏显示会出错
"let g:Powerline_colorscheme='solarized256'
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
" -------------------------------代 码 缩 进-----------------------------------
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=8
" 设置格式化时制表符占用空格数
set shiftwidth=8
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=8
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" tab
let g:indent_guides_tab_guides = 0
" percent
let g:indent_guides_color_change_percent = 90
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle
" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>
" -----------------------------cscope 设 置------------------------------------
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set csverb
endif
" The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  
nmap <Leader>css :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>csg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>csc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>cst :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>cse :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>csf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <Leader>csi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <Leader>csd :cs find d <C-R>=expand("<cword>")<CR><CR>
" 垂直新建窗口显示搜索结果
nmap <Leader>vs :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>vg :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>vc :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>vt :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>ve :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>vf :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <Leader>vi :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
nmap <Leader>vd :vert scs find d <C-R>=expand("<cword>")<CR><CR>
" ----------------------------代 码 折 叠--------------------------------------
"操作：za:打开或关闭当前折叠, zM:关闭所有折叠, zR:打开所有折叠.
" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
" ----------------------------标 识 符 列 表-----------------------------------
" 设置 tagbar 子窗口的位置出现在主编辑区的左边 
let tagbar_left=1 
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <Leader>ilt :TagbarToggle<CR> 
" 设置标签子窗口的宽度 
let tagbar_width=32 
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }
" --------------------------标 识 符 跳 转-------------------------------------
" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。
" 快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>
" 正向遍历同名标签
nmap <Leader>tn :tnext<CR>
" 反向遍历同名标签
nmap <Leader>tp :tprevious<CR>
" 设置搜索
let g:ctrlsf_ackprg = 'ag'
" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
" ---------------------------代 码 补 全---------------------------------------
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
" -------------------------------YCM-------------------------------------------
let g:ycm_auto_trigger = 0
" 
let g:ycm_confirm_extra_conf = 0
"let g:ycm_error_symbol = ''
"let g:ycm_warning_symbol = ''
let g:ycm_show_diagnostics_ui = 0
" 
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1,
      \ 'ctrlsf' : 1,
      \ 'vim-airline' : 1,
      \}
" -------------------------------syntastic-------------------------------------
let g:syntastic_check_on_open = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <Leader>e :SyntasticCheck<CR> 
nnoremap <Leader>f :SyntasticToggleMode<CR>
" ------------------------------NERDTree---------------------------------------
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <silent> <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
"let NERDTreeWinPos="right"
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
"------------------------------MiniBufExplorer---------------------------------
let g:miniBufExplorerAutoStart = 0
" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>
" buffer 切换快捷键
map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>
" -----------------------------ctags 搜 索 路 径-------------------------------
set tags=./tags;/
set guifont=Monaco\9
" -----------------------------------------------------------------------------
"set tabstop=4
"syntax on
"set guifont=Monaco \9
"colorscheme evening
"autocmd BufWritePost $HOME/.vimrc source $HOME/.vimrc 
"set hlsearch
" list file name
"let &titlestring = expand("%:p")
"if &term == "screen"
 " set t_ts=^[k
 " set t_fs=^[\
"endif
"if &term == "screen" || &term == "xterm"
  "set title
"endif

