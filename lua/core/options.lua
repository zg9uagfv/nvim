local opt = vim.opt

-- 基础配置

-- 高亮显示光标所在的当前行
opt.cursorline = true

-- 在终端中使用真彩色
opt.termguicolors = true

-- 有补全选项时，将显示一个带有可用选择的弹出菜单
opt.wildoptions = 'pum'

-- 弹出菜单的透明度，5是稍微透明，最大值100（全透明）
opt.pumblend = 5

-- 背景颜色方案设置为"dark"，插件、颜色和语法高亮将针对暗背景进行优化。
opt.background = 'dark'

-- 到时候插件要安装文件管理器 nvim-tree，所以需要在文件的开头禁用 netrw
-- = 1 是告诉Neovim netrw 已经载入了，不需要再载入
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 清除所有之前定义的 autocmd 并从干净的状态开始
vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- 显示左侧图标指示列   nv的gutter 有三种 number 显示数字 fold 显示折叠标志 sign 显示icon
-- icon 占用的列数可以设置 auto 或者 yes:1 yes:2 yes:3 （固定列数） 或者 number 和行号共占一列
vim.wo.signcolumn = "yes"
-- vim.wo.signcolumn = "auto"
-- vim.wo.signcolumn = "number"
-- vim.wo.signcolumn = "yes:1"
-- vim.wo.signcolumn = "auto:1"

-- 右侧参考线，超过表示代码太长了，考虑换行
-- vim.wo.colorcolumn = "80"
opt.colorcolumn = "80"

-- 仅在当前窗口显示行号
vim.wo.number = true
vim.opt.title = true

-- Neovim 会自动在新行添加空格或制表符以匹配现有的缩进级别
opt.autoindent = true
-- 高亮所有匹配的搜索模式
opt.hlsearch = true
-- 边输入边搜索
opt.incsearch = true

-- 禁止Neovim自动生成备份文件
opt.backup = false

-- 显示命令行渐入的命令
opt.showcmd = true

-- 设置命令行高度为 1
opt.cmdheight = 1

-- 每个分割窗口都有单独的状态行
opt.laststatus = 2

-- 使用空格而不是真实的制表符
opt.expandtab = true

-- 光标以上和以下保持的最小屏幕行数
opt.scrolloff = 10

opt.shell = 'zsh'
opt.backupskip = { "*.bak", "*/tmp/*" }

-- 在分割窗口中进行增量搜索
opt.inccommand = 'split'

-- 在搜索模式下忽略大小写
opt.ignorecase = true
-- Vim 将根据当前上下文自动使用空格和制表符的混合进行缩进。
opt.smarttab = true
-- 在 Vim 中显示换行线的可视指示
opt.breakindent = true
-- 设置每个缩进级别使用的空格数
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
-- 自动缩进
opt.ai = true
-- 智能缩进
opt.si = true
-- 不换行
opt.wrap = false
-- vim.opt.backspace = 'start,eol,indent'
opt.path:append { '**' } -- 查找文件 - 向下搜索子文件夹
opt.wildignore:append { '*/node_modules/*' }

-- 下划线
-- "\e[4:3m" 是用于下划线文本的 ANSI 转义序列，宽度为1像素
   vim.cmd([[let &t_Cs = "\e[4:3m"]])
   vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- 离开插入模式时取消粘贴模式
   vim.api.nvim_create_autocmd("InsertLeave", {
   pattern = "*",
   command = "set nopaste"
   })

-- 在注释行回车时自动插入注释符号
opt.formatoptions:append { 'r' }

opt.smartindent = true
-- 使用相对行号
opt.number = true
opt.relativenumber = false

-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true

-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- 不可见字符的显示，这里只把空格显示为一个点
-- vim.opt.listchars = {eol = '↲', tab = '▸ ', trail = '·'}
-- vim.opt.list = require("commConf").listchar
-- vim.o.listchars = "tab:··,trail:▫"
-- vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
vim.opt.listchars:append("trail:▫")
-- vim.o.list = false
-- vim.o.listchars = "space:·,tab:··"
-- vim.o.listchars = "tab:··,trail:▫"

opt.wildmenu = true
opt.smartcase = true
opt.autochdir = true
opt.visualbell = true
opt.autoread = true
opt.swapfile = false

opt.mouse = ""
opt.shortmess = "atI"
opt.updatetime = 300
opt.redrawtime = 1500
opt.timeoutlen = 500

-- folding
opt.foldenable = false
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99

-- list char
opt.list = true
opt.listchars = {
  tab = "   ",
  --trail = "",
  --extends = "»",
  --precedes = "«",
  --nbsp = "×",
}

-- backup
-- opt.backup = true
-- opt.backupext = ".bak"
-- opt.backupdir = "~/.config/nvim/tmp"

-- undofile
opt.undofile = false
