local o = vim.opt

-------------- Tabs/Indentations --------------
--
--Sets the number of spaces for a Tab key press or Backspace key press.
o.tabstop = 4
--Sets the number of spaces a tab character represents.
o.softtabstop = 4
--Converts tabs to spaces.
o.expandtab = true
--Number of spaces for each lever of indentation
o.shiftwidth = 4
--Enables line wrapping.
o.wrap = true
--allow for auto indentation
o.smartindent = true


-------------- Search --------------
--
--Highlight matches as you type the search pattern.
o.incsearch = true
--Perform case-insensitive search.
o.ignorecase = true
--Perform case-sensitive search if the pattern contains uppercase characters.
o.smartcase = true
--Continue searching from the top when the search reaches the end.
o.wrapscan = true
--Highlight all matches of the last search.
o.hlsearch = true


-------------- Appearance --------------
--
-- o.laststatus=0
--Displays line numbers on the left side.
o.number = true
--Displays the current mode (e.g., Normal, Insert) at the bottom of the screen.
o.showmode = true
--Highlights the current line.
o.cursorline = true
--allow full colors support in the terminal
o.termguicolors = true
--highlight a specific column in the text,	
o.colorcolumn = '100'
--used to control the width of the column reserved for signs
o.signcolumn = "auto"
--used to set the number of lines for the command-line area
o.cmdheight = 1
--it controls the minimum number of screen lines to keep above and below the cursor. 
o.scrolloff = 10
--used to control the behavior of the completion menu that appears when you use commands like :h, :e, :b, 
--    menu: Show a menu even when there's only one match. It provides visual feedback.
--    menuone: Show a menu even when there's only one match. Useful to see the context.
--    longest: Automatically select the longest common part of the matches.
--    preview: Show a preview of the currently selected completion.
o.completeopt = "menuone,noinsert,noselect"


-------------- Behaviour --------------
--
--Allows you to switch between buffers without saving changes. The current buffer is hidden instead of being closed.
o.hidden = true
--Controls error messages. If set, error messages will cause a bell to be rung.
o.errorbells = false
--Determines whether Vim creates swap files for editing.
o.swapfile = false
--Creates a backup file before overwriting a file.
o.backup = false
--Specifies the directory where undo files are stored and enables persistent undo.
o.undodir = vim.fn.expand("~/.vim/undodir")
o.undofile = true
--Controls what backspace can delete.
o.backspace = "indent,eol,start"
--Determines the default position for splitting windows.
o.splitright = true
o.splitbelow = true
--Changes the current working directory to the directory of the current file.
o.autochdir = false
--Specifies what characters Vim recognizes as part of a word.
o.iskeyword:append("-")
--Enables mouse support. n allows the mouse in Normal mode, a in all modes.
o.mouse:append('a')
--Specifies the clipboard to use. unnamedplus allows you to use the system clipboard.
o.clipboard:append("unnamedplus")
--Controls whether the buffer can be modified.
o.modifiable = true
--Specifies the character encoding used in the buffer.
o.encoding = "UTF-8"
--Specifies the cursor shape in GUI mode.
--o.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

