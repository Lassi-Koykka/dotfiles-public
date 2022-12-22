(import-macros {: map!} "hibiscus.vim")

(map! [n] "<leader>n" ":NvimTreeFindFileToggle<CR>")

(vim.api.nvim_create_autocmd "BufEnter" {
    :command "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"
    :nested true
})


