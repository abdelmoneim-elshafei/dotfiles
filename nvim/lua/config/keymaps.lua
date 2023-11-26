local k = vim.keymap
--
--noremap:
--Explanation: noremap stands for "non-recursive map." When you use noremap in a key mapping command,
--it ensures that the right-hand side of the mapping is not recursively expanded. 
--This is often what you want for key mappings to avoid unexpected behavior.
--
--silent:
--Explanation: silent suppresses the display of normal mode commands on the command line. 
--It is often used in mappings to prevent the command from being echoed to the command line, 
--reducing visual noise.
--
local o = { noremap = true, silent = true}

--k.set("<mode>", "<keymap_that_you_will_use>", "<what_keymap_will_do>",{options})

--------------------------------------------
---------- Global --------------------------
--------------------------------------------

k.set("i","jj","<ESC>",o)

--------------------------------------------
---------- Directory Navigation ------------
--------------------------------------------

k.set("n", "<A-1>", ":NvimTreeToggle<CR>",o)

--------------------------------------------
---------- Pane Navigation -----------------
--------------------------------------------

k.set("n","<C-h>","<C-w>h",o)   -- lef
k.set("n","<C-l>","<C-w>l",o)   -- right
k.set("n","<C-k>","<C-w>k",o)   -- up
k.set("n","<C-j>","<C-w>j",o)   -- down
k.set("n","<C-.>",":bnext<CR>",o)
k.set("n","<C-,>",":bprevious<CR>",o)
k.set("n","<C-x>",":bdelete<CR>",o)

--------------------------------------------
---------- Window Managemetn ---------------
--------------------------------------------

k.set("n","<leader>sv",":vsplit<CR>",o)   --split vertically
k.set("n","<leader>sh",":split<CR>",o)    --split Horizontally
--k.set("n","<leader>sm",":MaximizerToggle<CR>",o)    --Toggle Minimize

--------------------------------------------
---------- Indenting -----------------------
--------------------------------------------

k.set("v","<","<gv")
k.set("v",">",">gv")

--------------------------------------------
---------- Comment -------------------------
--------------------------------------------

vim.api.nvim_set_keymap("n", "<C-/>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-/>", "gcc", { noremap = false })

