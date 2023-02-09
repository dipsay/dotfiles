local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map("n", "<leader>n", "<CMD>bnext<CR>")
map("n", "<leader>p", "<CMD>bprevious<CR>")
map("n", "<leader>d", "<CMD>bdelete<CR>")

map("n", "<leader>fr", "<CMD>Telescope oldfiles<CR>")
map("n", "<leader>ff", "<CMD>Telescope find_files<CR>")
map("n", "<leader>fw", "<CMD>Telescope live_grep<CR>")

map("n", "<leader>tt", "<CMD>ToggleTerm size=15<CR>")

map("n", "<leader>dt", "<CMD>NvimTreeToggle<CR>")
map("n", "<leader>t", "<CMD>NvimTreeFocus<CR>")
