local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- General Settings
local general = augroup("General", { clear = true })

-- Leader-key
vim.g.mapleader = " "
-- Tab = 2 spaces wide
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.background = "light"

vim.opt.swapfile = false
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.wo.number = true

-- Quickfix-list navigation keys
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>zz")

-- Nvim-Terminal - Ctrl+z, then fg, also an option though
autocmd("TermOpen", {
	group = augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
		vim.keymap.set("t", "<Leader><ESC>", "<C-\\><C-n>", { noremap = true })
	end,
})
-- From Teej's vid about this; for 'small terminal' and 'big terminal'
vim.keymap.set("n", "<space>st", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 15)
end)
vim.keymap.set("n", "<space>bt", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 45)
end)

-- Disable auto-comment on new line
autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
	group = general,
	desc = "Disable Automatic New Line Comment",
})
-- Auto-save
autocmd({ "FocusLost", "BufLeave", "BufWinLeave" }, {
	-- for format on save
	nested = true,
	callback = function()
		-- Don't autosave when editing config-files, otherwise there's constant config-reload-messages
		-- expand('%:p') gives full file path; find checks if the string is inside
		if string.find(vim.fn.expand("%:p"), [[.config/nvim]]) then
			return
		end
		if vim.bo.filetype ~= "" and vim.bo.buftype == "" then
			vim.cmd("silent! w")
		end
	end,
	group = general,
	desc = "Auto Save",
})
-- Update file on change
autocmd("FocusGained", {
	callback = function()
		vim.cmd("checktime")
	end,
	group = general,
	desc = "Update file when there are changes",
})

-- move lines up and down!! Yess
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- update these commands to have line w/ cursor in the middle of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.cmd("colorscheme lushwal")
