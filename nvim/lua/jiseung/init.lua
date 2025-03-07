require('jiseung.telescope')
require('jiseung.treesitter')

-- Save the current Quickfix list
vim.keymap.set("n", "<leader>cqs", function()
    vim.g.previous_qflist = vim.fn.getqflist()
    print("Quickfix list saved!")
end, { desc = "Save Quickfix List" })

-- Restore the saved Quickfix list
vim.keymap.set("n", "<leader>cqr", function()
    if vim.g.previous_qflist then
        vim.fn.setqflist(vim.g.previous_qflist)
        print("Quickfix list restored!")
    else
        print("No Quickfix list saved!")
    end
end, { desc = "Restore Quickfix List" })
