return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        local config = require("nvim-treesitter.configs")
        config.setup({
            auto_install = true,
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        })
        parser_config.powershell = {
            install_info = {
                url = "~/.config/nvim/tsparsers/tree-sitter-powershell",
                files = { "src/parser.c", "src/scanner.c"},
                branch = "main",
                generate_requires_npm = false,
                requires_generate_from_grammar = false,
            },
            filetype = "ps1",
        }
    end,
}
