打字练习: https://type-fu.com/app
打字练习: https://type-fu.com/app

向上
conflict-markers.vim

## 2023-04-27 11:59:15

- @todo 自动保存优化

  - 更好的事件监听 只监听 active buffer 离开
  - 只保存真正改变的文件

```
https://www.reddit.com/r/neovim/comments/s0i40v/how_do_i_detect_and_close_if_a_buffer_has_not_had/
https://vi.stackexchange.com/questions/25746/vimscript-how-to-check-if-a-buffer-is-modified
:h getbufinfo
vim.api.nvim_echo
```

- @ques 自增快捷键

```lua
vim.diagnostic.setqflist、vim.diagnostic.setloclist
vim.lsp.buf.references()
vim.lsp.buf.document_symbol()
vim.lsp.buf.outgoing_calls()
vim.lsp.buf.incoming_calls()
```

```lua
line1 = vim.api.nvim_buf_get_mark(0, "<")[1]
line2 = vim.api.nvim_buf_get_mark(0, ">")[1]
vim.fn.getpos('v')
print(workspaces_utils.path.basename(get_current_cwd()))

```

httpt://www.reddit.com/r/neovim/comments/oo97pq/how_to_get_the_visual_selection_range/

https://github.com/natecraddock/sessions.nvim
https://www.youtube.com/watch?v=1f7l2-Fap2s

- vim 的缺点，没有高级编辑器的功能 甚至是 api，历史包袱太重了

  - statusline show cur file path
  - shortcut open terminal
  - react snippets -> 可能要自己写
  - harpoon -> c-a
  - 我需要一个脚本来执行所有的拉取所有的配置文件然后放到一个仓库中
  - bindKey for c-number
  - mac alac 在任务栏有多个
  - find in current folder
  - 全局替换
  - vscode 快速的打开项目+文件
  - dot repeat
  - tab 能不能和窗口相关
  - telescope buildIn 功能
  - refrence telescope
  - alac 新建窗口，合并窗口到一个 app 下
  - Zellij
  - zsh 配置框架我推荐 zimfw，prompt 用 powerlevel10k。速度快且配置超简单。我已经用了好多年了。
  - fzf + tmux
    - https://github.com/sainnhe/tmux-fzf
    - https://dev.to/waylonwalker/jump-to-running-tmux-sessions-with-fzf-4p77
    - https://elijahmanor.com/blog/fd-fzf-tmux-nvim
    - c-f 查找打开
    - enter tmux but not create -> `tmux attach || tmux new`
  - https://github.com/bsdelf/bufferhint
  - keymap only for harpoon
  - fzf folder
  - 要不要用 c-enter 代替 O
  - 删除 tag 不删除内部内容
  - 文件历史
  - 单词检查
  - close tab but not close buffer
  - message 的位置
  - 重新打开当前文件
  - react snippets
  - nvim-tree 折叠其他文件架
  - dropFile to nvim-tree
  - 块注释
  - 在侧边窗口打开 reference
  - 引入函数会自动加上调用
  - close file path open
  - telescope code action
  - Telescope code_actions - 向下复制
  - diff git
  - move file in sidebar
  - hightlight current line

  - move file to next window

  - 注释 区间
  - ctrl+enter shift+ctrl+enter
  - 尝试一个文件操作 -> 这样能不能提高效率
  - getCurrentFileName
  - 在侧边栏打开文件
  - keep selection and dulplate to bottom or top
    - 加强 indent -- `>`
    - 能不能写一个脚本来做这个事情
      - visual mode 获得当前选择了多少行 -> 复制 -> Paste -> 移动...
      - https://github.com/theHamsta/nvim-treesitter/blob/a5f2970d7af947c066fb65aef2220335008242b7/lua/nvim-treesitter/incremental_selection.lua#L22-L30
  - 是否保存 --> 看文件有没有修改
    - 参考 auto-save 的实现
    - 怎么 运行不会导致 程序卡住
  - 外套 tag
  - 复制选区
  - 关闭 swap
  - autoclose tag
  - refrence... 使用 popup 打开
  - 项目管理 tmux
    - save lastest open file
  - change case
  - 如何插入时间
  - ***
  - tmux split window ...
  - workspace session manager
  - sign
  - macro
  - code action sort import

- @ques open file in next panel
- @ques 全局 replace
- @ques emit 自动补全 tag

- @ques 如何切换 tab
- @ques reveal in sidebar in vim
- @ques 复制文件夹 + 粘贴
- @ques 快速关闭 window
- @ques 感觉 vim 上的文件目录不好用，这样用户就会对目录结构缺少感知
- @ques 手指的感觉记忆
- @ques 如何跳转文件
- @ques 如何 在不同的文件中跳转
- @ques vim buffer 能做什么
- @ques 如何键盘的位置 -> 感觉这给我添加很多东西要做啊
- @ques nvchad 如何一键更新
- @ques 感觉 nvim 的文件切换不方便
- @ques vim 中有没有重复的命令的方法
- @ques vimbegood 使用快捷键激活
- @ques 最好的管理命令行的方式 像 vscode 从底部出现并且可以 split

## end

- alt-z toggle wrap
- 纵向移动行

- @ques quickfix
  - https://neovimcraft.com/plugin/kevinhwang91/nvim-bqf/index.html
- workspace
- min-map

- @ques prettier format markdown

  - https://neovimcraft.com/plugin/folke/trouble.nvim/index.html

- ts + prettier
- 像 vscode 一样当前 function 挂在页面的最顶上
- @ques 如何 formatOnSave
- @ques nvchad 默认运行命令

- @ques 路径自动补全功能 类似 vscode `ctrl+.`
- @ques 怎么直接显示 Diagno

- @ques eslint code action

  - https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint

- @ques coc 自动补全 import

  - https://www.reddit.com/r/neovim/comments/w9mqui/new_to_neovim_how_to_get_the_quick_fix_menu_to/
  - https://github.com/kosayoda/nvim-lightbulb

- @ques cmp 自动补全的效果
- @ques statusbar 没有显示 folder

- @ques 如何修改字符或者其他东西

- @ques treesitter 的 tsx 文件高亮并不好
- 更新 nvv11had

```lua
experimental = {
        ghost_text = {
            hl_group = false
        },
    },
```

## 2023-04-27 11:59:15

```lua
print(workspaces_utils.path.basename(get_current_cwd()))
```

https://www.youtube.com/watch?v=1f7l2-Fap2s
https://github.com/natecraddock/sessions.nvim

- vim 的缺点，没有高级编辑器的功能 甚至是 api，历史包袱太重了

  - 块注释

- @ques 前端项目配置

  - workspace session manager

  - telescope code action
  - Telescope code_actions - 向下复制
  - diff git
  - move file in sidebar
  - hightlight current line

  - move file to next window

  - 注释 区间
  - ctrl+enter shift+ctrl+enter
  - 尝试一个文件操作 -> 这样能不能提高效率
  - getCurrentFileName
  - 在侧边栏打开文件
  - keep selection and dulplate to bottom or top
    - 加强 indent -- `>`
    - 能不能写一个脚本来做这个事情
      - visual mode 获得当前选择了多少行 -> 复制 -> Paste -> 移动...
      - https://github.com/theHamsta/nvim-treesitter/blob/a5f2970d7af947c066fb65aef2220335008242b7/lua/nvim-treesitter/incremental_selection.lua#L22-L30
  - 是否保存 --> 看文件有没有修改
    - 参考 auto-save 的实现
    - 怎么 运行不会导致 程序卡住
  - 外套 tag
  - 复制选区
  - 关闭 swap
  - autoclose tag
  - refrence... 使用 popup 打开
  - 项目管理 tmux
    - save lastest open file
  - change case
  - 如何插入时间
  - ***
  - sign
  - macro
  - code action sort import

- @ques open file in next panel
- @ques 全局 replace
- @ques emit 自动补全 tag

- @ques 如何切换 tab
- @ques reveal in sidebar in vim
- @ques 复制文件夹 + 粘贴
- @ques 快速关闭 window
- @ques 感觉 vim 上的文件目录不好用，这样用户就会对目录结构缺少感知
- @ques 手指的感觉记忆
- @ques 如何跳转文件
- @ques 如何 在不同的文件中跳转
- @ques vim buffer 能做什么
- @ques 如何键盘的位置 -> 感觉这给我添加很多东西要做啊
- @ques nvchad 如何一键更新
- @ques 感觉 nvim 的文件切换不方便
- @ques vim 中有没有重复的命令的方法
- @ques vimbegood 使用快捷键激活
- @ques 最好的管理命令行的方式 像 vscode 从底部出现并且可以 split

## end

- alt-z toggle wrap
- 纵向移动行

- @ques quickfix
  - https://neovimcraft.com/plugin/kevinhwang91/nvim-bqf/index.html
- workspace
- min-map

- @ques prettier format markdown

  - https://neovimcraft.com/plugin/folke/trouble.nvim/index.html

- ts + prettier
- 像 vscode 一样当前 function 挂在页面的最顶上
- @ques 如何 formatOnSave
- @ques nvchad 默认运行命令

- @ques 路径自动补全功能 类似 vscode `ctrl+.`
- @ques 怎么直接显示 Diagno

- @ques eslint code action

  - https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint

- @ques coc 自动补全 import

  - https://www.reddit.com/r/neovim/comments/w9mqui/new_to_neovim_how_to_get_the_quick_fix_menu_to/
  - https://github.com/kosayoda/nvim-lightbulb

- @ques cmp 自动补全的效果
- @ques statusbar 没有显示 folder

- @ques 如何修改字符或者其他东西

- @ques treesitter 的 tsx 文件高亮并不好
- 更新 nvv11had

```lua
experimental = {
        ghost_text = {
            hl_group = false
        },
    },
```
