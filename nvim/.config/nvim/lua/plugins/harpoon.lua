return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()
        vim.keymap.set("n", "<leader>ha", function()
            harpoon:list():append()
        end, {
            desc = "Harpoon file",
        })
        vim.keymap.set("n", "<leader>hi", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, {
            desc = "Harpoon ui quick menu",
        })
        vim.keymap.set("n", "<c-h><c-h>", function()
            harpoon:list():select(1)
        end, {
            desc = "Harpoon select file 1",
        })
        vim.keymap.set("n", "<c-h><c-j>", function()
            harpoon:list():select(2)
        end, {
            desc = "Harpoon select file 2",
        })
        vim.keymap.set("n", "<c-h><c-k>", function()
            harpoon:list():select(3)
        end, {
            desc = "Harpoon select file 3",
        })
        vim.keymap.set("n", "<c-h><c-l>", function()
            harpoon:list():select(4)
        end, {
            desc = "Harpoon select file 4",
        })
    end,
}
