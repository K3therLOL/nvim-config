return {
    "kristijanhusak/vim-dadbod-ui",

    dependencies = {
        { "tpope/vim-dadbod", lazy = true },
        { 
            "kristijanhusak/vim-dadbod-completion", 
            ft = { "sql", "mysql", "plsql" }, 
            lazy = true
        }
    },

    cmd = {
        "DBUI",
        "DBUIToggle",
        "DBUIAddConnection",
        "DBUIFindBuffer",
    },

    keys = {
        { "<leader>B", "<cmd>DBUI<CR>", desc = "Open DBUI" },
        { "<leader>Bf", "<cmd>DBUIFindBuffer<CR>", desc = "Open buffer for DBUI" },
    },

    init = function()
        -- Configuring DBUI
        vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/db_ui_state.vim"
        vim.g.db_ui_winwidth = 50

        -- Template to connect to database
        -- Example: postgres://username:password@host:port/database
        vim.g.db_ui_connection_patterns = {
            ["postgres"] = {
                pattern = "^postgres://(\\w+):(\\w+)@",
                driver = "postgres",
            },
            ["mysql"] = {
                pattern = "^mysql://(\\w+):(\\w+)@",
                driver = "mysql",
            },
        }
        -- vim.g.db_ui_use_nerd_fonts = 1
        vim.g.db_ui_execute_on_save = 0
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "dbout",
            callback = function()
                vim.wo.foldenable = false
            end,
        })
    end,
}
