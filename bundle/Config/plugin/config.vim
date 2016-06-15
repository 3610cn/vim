" 色彩主题
if $TERM == "xterm-256color"
    set t_Co=256 " 256 色
endif

syntax enable
set background=dark
colorscheme solarized

" 关闭兼容模式
set nocompatible
" 开启魔法匹配
set magic
" 退格键行为
set backspace=indent,eol,start
" 右下角显示标尺
set ruler
" 编码设置
set fileencodings=ucs-bom,utf-8,gbk
set fileformats=unix,dos,mac

"设置-为变量一部分
set iskeyword+=-

"设置行号
set nu

"ctags
map [[ <c-t>
map ]] <c-]>
"taglist
map <silent> <F9> :TagbarToggle<cr>

" 缩进设置
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" 高亮括号对
set showmatch
" 自动缩进
set autoindent
" 高亮搜索
set hlsearch
" 状态栏显示键入的命令
set showcmd
" 不创建备份文件
set nobackup
" 高亮当前行
set cursorline
" 智能大小写判断
set ignorecase smartcase
" 语法高亮
syntax on
" 打开文件类型支持
filetype plugin indent on
" 递归向上查找 tags
set tags=tags;
" 修复 Terminal 下面中文双引号的问题
set ambiwidth=double

" 即时搜索
set incsearch

" 永远显示状态栏
set laststatus=2

"NERDTree
map nd :NERDTreeToggle<cr>

" 平滑的滚屏 *scroll-smooth*
map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>

" 打开javascript折叠
let b:javascript_fold=1
" 打开javascript对dom、html和css的支持
let javascript_enable_domhtmlcss=1

"当粘贴文本时, vim对自动进行格式化, 效果很不好, 这个命令使得在插入状态下用F3键就进入粘贴模式, 不会格式化
set pastetoggle=<F4>

" undo dir
if v:version >= 703
  set undodir=$HOME/.vimundodir
  set undofile
endif

" jsbeautify
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" 打开文件时跳到上次编辑的位置
autocmd BufReadPost * call handy#JumpToLatest()

if (!(has("win32") || has("win64")))
    autocmd BufWritePost * call system('bsync '.expand('%:p').' &')
endif

" 保存文件时自动去除 trailing whitespace
autocmd BufWritePre *.js call handy#RemoveTrailingWhitespace()

" 写文件时去去找 jstags.sh 生成 tag
autocmd BufWritePost *.js call handy#GenerateTag()

" ctrlp
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*/*target/*,*/target*/*,*/node_modules/*
set wildignore+=*/app/*,*/mu/*

" fecs
" 不建议首次打开文件时进行检查
let g:syntastic_check_on_open = 0
" `:wq`时不进行检查，注意这跟`:w`不一样
let g:syntastic_check_on_wq = 0
" 如果你想在写文件时不进行检查，需要配置`passive`模式
" 在`passive`模式下，只有手动调用了`:SyntasticCheck`才会触发检查
" let g:syntastic_mode_map = {'mode': 'passive'} 
" 你可以配置一个快捷方式，用来快速检查当前文件
" nmap <silent> <F5> :SyntasticCheck<cr>
let g:syntastic_javascript_checkers = ['fecs']
let g:syntastic_javascript_fecs_args = "--reporter=baidu"
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠""
