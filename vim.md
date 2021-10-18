# vim入门

>  本文环境：Ubuntu 21.04 x86_64,VIM - Vi IMproved 8.2,
>
>  [参考教程](https://www.imooc.com/learn/1129)

# 三种模式

vim插入模式

i：在当前字符前面插入

o: 在当前的下一行插入

A: 在这一行最后插入

I：在这一行最前面插入

O：在当前的上一行插入



：set nu 设置行号

：sp 竖分屏

：vs 横分屏

%代表全部文件，s代表替换命令 ，末尾 g 代表全局替换，将全部的 java 替换成 php

举例：`:% s/java/php/g`


**Visual（可视模式）**

**v 进入 visual 模式**

**V 选择行**

**Ctrl+v 文本方块选择**

## vim编辑小技巧

* ctrl+h ：删除上一个字符

* ctrl+w：删除上一个单词

* ctrl+u : 删除当前行

### 终端下小技巧

* ctrl+a ：移动到开头
* ctrl+e : 移动到末尾
* ctrl+b ：前移
* ctrl+f：后移

## 快速切换模式

替代esc

* ctrl+[
* ctrl+c 可能会终止某些插件

* **gi快速跳转到吗最后一次编辑的地方并插入模式**

## 快速移动（默认模式下）

* w/W移到下一个word开头
* e/E移到一下个word末尾
* b/B移动上一个word开头
* word指的是以非空白符分隔的单词WORD以空白符分割的单词

`:syntax on   `临时解决语法高亮 

#### 行间搜索移动

* f{想要搜索的字符}可以快速移动到字符上，`;`下一个相同字符，`,`上一个相同字符，t移动到前一个字符

#### vim水平移动

* 0移动到一个字符 ,^移动到第一个非空白字符
* $ 移动到行尾，g_移动到行位非空白字符

#### vim页面移动

* gg/G  文件开头/结尾
* ctrl+o 快速返回
* H/M/L   屏幕的开头/中间/结尾
* ctrl+u/ctrl+f 上下翻页   zz把屏幕质为中间

## vim增删改查

### vim快速删除

* vim在normal模式下使用x快速删除一个字符
* d配合文本对象快速删除一个单词包括空格`daw`
* dd删除整行 `dt()`快速删除括号里面的东西

### vim修改

* r可以替换一个字符，s替代并进入插入模式
* c配合文本对象，进行快速修改

### vim查找

* 使用/或者?进行前向/后向查找
* 使用n/N跳转到下一个/上一个

### vim如何搜索替换

* substitute命令允许我们查找并替换文本，支持正则表达式

  ```shell
  :[range]s[ubstitute]/{pattern}/{string}/[flags]
  range表示范围，比如10，20 表示前10-20行，%表示全部
  pattern是要替换的模式，string是替换后的文本
  flags常用的标志
  g（global）表示全局范围里执行
  c（comfirm）表示确认，可以确认或拒绝修改
  n（number）报告匹配到的次数而不替换，可以用来查询匹配次数
  
  将文本文档中全部的 java 替换成 php
  举例：`:% s/java/php/g
  ```

### vim多文件操作

```
 buffer是指打开的一个文件的内存缓冲区
 窗口是buffer可视化的分割区域
 tab可以组织窗口为一个工作区
```

> buffer之间跳转

* 使用ls会列举当前缓冲区，然后使用:b n 跳转到第n个缓冲区，也可以加文件名

```ssh
打开一个vim yzh.txt后
:e a.txt
就打开了a的编辑窗口
:e b.txt
打开了b的编辑窗口
:ls
  1      "a.txt"                        第 1 行
  2 %a   "b.txt"                        第 2 行
  3 #    "yzh.txt"                      第 2 行
:b 2 或者使用 :b b.txt
跳转到b.txt编辑界面

```

> window窗口

* 窗口是可视化的分割区域

`：sp 竖分屏`

`：vs 横分屏`

> （tab）标签页

将 窗口分组

```shell
将窗口分组
打开TXT文档
vim a.txt
:vs b.txt

:tabnew 1.java
这个时候两个标签
gt
在两个标签页之间来回切换
```

### vim的Text.object（文本对象）

```shell
[number]<command>[text object]
number表示次数，command是命令，d(elete),c(hange),y(yank复制)
text object表示文本对象，比如单词w，句子s，段落p
```

#### vim复制粘贴

vimnormal模式下

复制使用y和p

#### 深入寄存器

vim不使用单一寄存器，而是多组寄存器

* 通过“{register}可以指定寄存器，不指定用默认寄存器
* 比如“ayiw复制一个单词到寄存器a中，"bbb删除当前行到寄存器中

```shell
this is [word]
输入“ayy
复制到a寄存器中

:reg a
Type Name Content
  l  "a   this is [word]^J
在新的一行
“ap
就将a中的粘贴到新的一行
```

##### vim常见寄存器

* 复制专用寄存器0
* 系统粘贴板“+，可以去其他地方粘贴，不只是在vim中

### vim 的宏（macro）

宏的定义：可以看成一系列命令的集合。类似于拍电影

* 使用q来录制，同时q也是结束
* 使用q{register}选择要保存的寄存器，把录制的命令保存其中
* 使用@{register}回放寄存器当中的命令

举例：

``` 
给多行url加双引号
qa 开始录制在寄存器a中，会出现@a的标志
I   进入插入模式，在前面
"
esc
A    今天插入模式，在末尾
"
q    结束录制
到第二行使用
@a
就自动加了双引号
shift+v 选择一行
G 到达末尾
:normal @a

```

### vim补全

* ctrl+n或者ctrl+p补全单词
* ctrl+x或者ctrl+f补全文件名
* ctrl+x或者ctrl+o补全代码，需要开启文件类型检查，安装插件

```
:set nu 显示行号
:syntax on 语法高亮
:set autoindent 自动缩进
ctrl+n 有多个话，使用ctrl+n进行切换

补全文件名
比如：with open('./
输入ctrl+x ctrl+f
就把当前文件下所有的文件ctrl+n进行选择、

全能补全
:filetype on
:set filetype 能显示文件类型

插入当前文件名
:r! echo %
插入当前文件的全部的路径
:r! echo %:p

```

### vim换个yanse

* 使用:colorscheme 显示当前主题的颜色，默认是default
* 使用:colorscheme <ctrl+d>显示所有配色
* 有中意的配色后用:colorscheme配色名，就可以修改颜色

#### 从网上下载配色



# 配置自己的vim

* 新建一个隐藏文件夹 vim ~/.vimrc

### 常用的设置

* 把常用的配置写进.vimrc里避免每次打开vim重新设置

```
vim ~/.vimrc
输入
set number
syntax on
ZZ 可以退出
```

* **常用设置**

```vim
" 常用设置

" 设置行号

set number

colorscheme hybrid

" 按F2进入粘贴模式

set pastetoggle=<F2>

" 高亮搜索

set hlsearch

" 设置折叠方式

set foldmethod=indent



” 一些方便的映射

Let mapleader= ','

let g:mapleader=','

" 使用jj进入normal模式

inoremap jj <Esc>`^

"使用leader+w 直接保存

inoremap <leader>w <Esc> :w<cr>

noremap < leader>w :w<Cr>

" 切换buffer

nnoremap <silent> [b :bprevious<CR>

nnoremap <silent> [n :bnext<CR>

" use ctrl+h/j/k/L switch window

noremap <C-h> <C-w>h

noremap <C-j> <C-w>j

noremap <C-k> <C-w>k

noremap <C-1> <C-w>l



"Sudo to write

cnoremap w!! w !sudo tee % >/dev/null

" json格式化

com! FormatJSON %!python3 -m json.tool



" 插件设置，这里使用了vim-plug

call plug#begin('~/ . vim/plugged')



"安装插件只需要把github 地址放到这里重启后执行:PlugInstall 就好了

PLug 'mhinz/vim-startify'

PLug 'scrooloose/nerdtree'



call plug#end()


zt 可以将当前行放在第一行
```

### vim中的映射

#### normal模式下

定义：把一个操作映射到另一个操作

按照你的意愿定制vim（当我按下某些按键，放弃你原来的操作，按我的想法做）

基本映射是指在normal下的映射

* 使用map命令就可以实现映射。比如：map —x ，然后按下-就会删除字符
* :map <space> viw 告诉vim按下空格的时候选择整个单词
* :map - <c-d> dd可以使用ctrl+d执行删除dd这一行

#### 其他模式下

使用vmap/imap定义映射只在visual/insert分别有效

举例：在insert模式下映射ctrl+d删除一行

:imap <c-d>  <esc>ddi

## vim插件

* 安装插件管理器

> https://github.com/junegunn/vim-plug安装方法可以看文档
>
> ```
> vim ~/.vimrc
> 插入如下的代码
> " Specify a directory for plugins
> " - For Neovim: stdpath('data') . '/plugged'
> " - Avoid using standard Vim directory names like 'plugin'
>  call plug#begin('~/.vim/plugged')
> 
>   
> " Initialize plugin system
>  call plug#end()
> 
> ```

* 安装第一个插件

> ```
> https://github.com/mhinz/vim-startify访问这
> 
> 将  Plug 'mhinz/vim-startify' 插入中间
> call plug#begin('~/.vim/plugged')
>   Plug 'mhinz/vim-startify'
>   
>   " Initialize plugin system
>   call plug#end()
> "~/.vimrc" 24L, 444B   
> 
> 
> 重启vim或者source一下.vimrc执行:pluginstal
> :source ~/.vimrc
> :PlugInstall
> :qa 退出所有的窗口
> 输入vim
> 就看到你的插件
> ```

#### 寻找适合自己的插件

* 通过谷歌搜索

> 比如搜索文件管理相关的
>
> vim file manager plugin
>
> 比如python相关的
>
> vim python plugin github

* 通过网站

> https://vimawesome.com/

#### vim 美化插件

https://github.com/vim-airline/vim-airline

#### vim文件目录

```
https://github.com/preservim/nerdtree
打开文件输入
:NERDTree
添加映射
" nerdtree settings
  
  nnoremap <leader>v :NERDTreeFind<cr>
  
  nnoremap <leader>g :NERDTreeToggle<cr>
  
  " set width
  
  let NERDTreeWinSize=31
  
  " show hidden files
  
  let NERDTreeShowHidden=1
  
 " not show files listed
使用`,g`打开目录树
进入一个文件后使用`,v`跳转带对应的文件夹目录，使用ctrlw+p,返回文件
```

#### 文件查找

```
https://github.com/kien/ctrlp.vim
打开vim 输入ctrl+p 输入想要查找的文件名
结合nerdtree插件，输入
,v
快速定位到文件
```

* 快速定位 ss

#### vim操作成对{}“”[]

```

Plug 'tpope/vim-surround'

cs 换括号等 例如 `cs ( ]`

ds 删除冒号括号等  例如 `ds (`

ys 增加冒号括号等   例如`ys iw "`iw表示选中这个单词

```

#### 模糊搜索和替换

```
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

如果使用`Ag`命令需要安装

`  apt-get install silversearcher-ag`

打开文件后`:Ag 需要查找的单词`就出现了使用ctrl+j/k上下移动
替换
Plug 'brooth/far.vim'
:Far 原单词 新单词  **/*
```

#### vim-go插件

```
ctrl+]跳转，ctrl+o跳回来

:GoFmt  自动格式化代码

:GoRename url    newurl     代码重构

:GoImports   自动导入包
```

#### vim tagbar 浏览代码

```
$ git clone https://github.com/universal-ctags/ctags.git
$ cd ctags
$ sudo apt install \
    gcc make \
    pkg-config autoconf automake \
    python3-docutils \
    libseccomp-dev \
    libjansson-dev \
    libyaml-dev \
    libxml2-dev
$ ./autogen.sh
$ ./configure --prefix=/where/you/want # defaults to /usr/local
$ make
$ make install # may require extra privileges depending on where to install

然后安装插件
Plug 'preservim/tagbar'
打开文本文档                   
:TagbarToggle
Tagbar: Exuberant ctags not found!
Please download Exuberant Ctags from ctags.sourceforge.net and install it in a directory in your $PATH or set g:tagbar_ctags_bin.
解决办法
apt install exuberant-ctags 
添加映射
"tagbar
  nnoremap <leader>t :TagbarToggle<CR>
打开文件输入`,t`就可以查看代码

语法高亮
Plug 'lfv89/vim-interestingwords'
<leader>k显示高亮
<leader>K清除高亮
```

#### vim代码补全



~~~
https://github.com/Shougo/deoplete.nvim
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

报错代码
[deoplete] VimEnter 自动命令 "*"..function deoplete#enable[9]..deoplete#initialize[1]..deoplete#init#_initialize[10]..<SNR>91_init_internal_variables[11]..neovim_rpc#serveraddr，第 18 行 处理 VimEnter 自动命令 "*"..function deoplete#enable[9]..deoplete#initialize[1]..deoplete#init#_initialize[10]..<SNR>91_init_internal_variables[35]..VimEnter 自动命令 "*"..function deople te#enable[9]..deoplete#initialize[1]..deoplete#init#_initialize[10]..<SNR>91_init_internal_variables[29]..neovim_rpc#serveraddr 时发生错误
解决方法
apt install python3-pip
修改 ~/.pip/pip.conf (没有就创建一个)， 内容如下：
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
执行，安装一些依赖
pip3 install jedi
pip3 install pynvim
~~~

#### vim代码格式化和静态检查

```
https://github.com/sbdchd/neoformat
Plug 'sbdchd/neoformat'
以python举例
pip install autopep8
进入.py 文件
:Neoformat

https://github.com/dense-analysis/ale#standard-installation
Plugin 'dense-analysis/ale'
pip install pylint

```

#### vim快速注释

```
https://github.com/tpope/vim-commentary
进入文件
gcc注释这一行
gcgc取消注释
```

#### vim和git

```
https://github.com/tpope/vim-fugitive
:Gblame 可以查看代码谁写的
:Gdiff 可以查看改动
https://github.com/airblade/vim-gitgutter


```

#### vim和tumx

```
apt install tumx
tumx new -s py
ctrl+b+% 竖分屏
使用oh-my-tmux
$ git clone https://github.com/gpakosz/.tmux.git /path/to/oh-my-tmux
$ ln -s -f /path/to/oh-my-tmux/.tmux.conf ~/.tmux.conf
$ cp /path/to/oh-my-tmux/.tmux.conf.local ~/.tmux.conf.local
即拿即用
ctrlA+e打开配置文件
ctrlA+r 重新加载配置文件
ctrl+l 清空屏幕
ctrlA+ctrlc  创建一个新会话，
ctrlA+s 看列表
ctrlA+$ 重新命名
ctrlA+ctrlf切换对话
```



