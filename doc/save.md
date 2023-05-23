https://github.com/wsdjeg/Learn-Vim_zh_cn
Vim cheatsheet: https://quickref.me/vim.html
https://alpha2phi.medium.com/modern-neovim-user-interface-and-pde-1605567b746e
https://neovim.io/doc/user/api.html

## 命令

```lua
local ts_utils = require("nvim-treesitter.ts_utils")
ts-utils.get_node_at_cursor()
vim.api.nvim_list_wins()
vim.api.nvim_tabpage_list_wins(0)


vim.api.nvim_win_get_cursor(0)
vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { uuid })

lua=vim.fn.line('.')
lua=vim.fn.col('.')

lua=vim.fn.col('v')

lua=vim.fn.line('v')

{
    start= {vim.fn.line('v'), vim.fn.col('v'), }
 }



lua=print(vim.inspect(
    vim.fn.visualmode(), -- last visual mode
    vim.fn.getpos("'<'"), -- last start
    vim.fn.getpos("'>'"), -- last end
    vim.fn.line('v'), -- current visual line
    vim.fn.col('v') -- current visual column
)) end, })
```

- 全局搜索替换

```text
You need a set of items that are the things you wish to replace. vimgrep, FzF, or Telescope can all do this.
You pipe them to a quickfix list. For telescope its C-q, I think its A-tab in FzF (i don't use), and vimgrep goes directly to QF list
Use cdo. cdo can even do confirm.

---

https://github.com/nvim-pack/nvim-spectrn
nvim-pack/nvim-spectre
```

## 目标

- 所有的功能都是渐入式的，不需要先置操作，等到我需要的时候他就在那里了

- 文件切换 window.manager
- 文件内跳转选择 better_scope

- 最快的纵向移动 -> ?
- 最快的横向移动 -> ?
- 代码块移动 -?

文件切换 + 代码切换 + 项目切换

## 功能

vertical move line
https://www.youtube.com/watch?v=X5IAdaN6IwM

## 可能用的插件

conflict-markers.vi
https://www.youtube.com/watch?v=9IcXJvoPHCY&list=PLhoH5vyxr6QqPtKMp03pcJd_Vg8FZ0rtg&index=13
https://github.com/johmsalas/text-case.nvim
NeoComposer.nvim
mrjones2014/legendary.nvim

https://github.com/ThePrimeagen/harpoon

## 快捷键

- cursor 最近的位置 ctrl+o | Ctrl+i

- 设置当前文件的文件夹为 workspace `:cd %:p:h`
- cheetsheet <leader>+c+h

## 2023-04-25 12:11:18

- @ques 如何 prettier
- @ques 如何跳转 workspace
- @ques 如何安装 typescript
- @ques 如何跳转链接
- @ques 如何 refresh 文件

- nvchad

## 熟悉 nvim

- @ques 怎么熟悉 vim 的操作

  - 有什么比较有效率的方式
    - vscode 只有 vim 插件
  - 跳转
  - 选中
  - 复制 ...
  - 多行操作

- @todo 熟悉 nvim

  - 熟悉 nvim 基本操作 ->

    - 跳转
    - 选中
    - 复制 ...
    - 多行操作

  - 配置
    - nvim prettier 配置
    - vscode 快速打开
    - ts 补全
    - err

## end

lua/plugins/noice.lua
andymass/vim-matchup
https://github.com/kevinhwang91/nvim-bqf
