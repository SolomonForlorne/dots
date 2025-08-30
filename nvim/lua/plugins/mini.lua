return {
  {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'tomorrow_night',
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    always_show_tabline = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                        refresh_time = 16, -- ~60fps
                        events = {
                            'WinEnter',
                            'BufEnter',
                            'BufWritePost',
                            'SessionLoadPost',
                            'FileChangedShellPost',
                            'VimResized',
                            'Filetype',
                            'CursorMoved',
                            'CursorMovedI',
                            'ModeChanged',
                        },
                    }
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { 'filename' },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {}
            }
        end
    },
    {
        'gorbit99/codewindow.nvim',
        config = function ()
            require('codewindow').setup()
            require('codewindow').apply_default_keybinds()            
        end
    },
    {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
    }
--
--
--     -- {
--     --     'echasnovski/mini.nvim',
--     --     config = function()
--     --         local statusline = require 'mini.statusline'
--     --         statusline.setup { use_icons = true }
--     --     end
--     -- },
--     -- Mini Nvim
--     { "nvim-mini/mini.nvim", version = false },
--     -- Comments
--     {
--         version = false,
--         dependencies = {
--             "JoosepAlviste/nvim-ts-context-commentstring",
--         },
--         config = function()
--             -- disable the autocommand from ts-context-commentstring
--             require('ts_context_commentstring').setup {
--                 enable_autocmd = false,
--             }
--
--             require("mini.comment").setup {
--                 -- tsx, jsx, html , svelte comment support
--                 options = {
--                     custom_commentstring = function()
--                         return require('ts_context_commentstring.internal').calculate_commentstring({
--                                 key =
--                                 'commentstring'
--                             })
--                             or vim.bo.commentstring
--                     end,
--                 },
--             }
--         end
--     },
--     {
--         'nvim-mini/mini-map',
--         version = false
--     },
--     {
--         "nvim-mini/mini.surround",
--         event = { "BufReadPre", "BufNewFile" },
--         opts = {
--             -- Add custom surroundings to be used on top of builtin ones. For more
--             -- information with examples, see `:h MiniSurround.config`.
--             custom_surroundings = nil,
--
--             -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
--             highlight_duration = 300,
--
--             -- Module mappings. Use `''` (empty string) to disable one.
--             -- INFO:
--             -- saiw surround with no whitespace
--             -- saw surround with whitespace
--             mappings = {
--                 add = 'sa',            -- Add surrounding in Normal and Visual modes
--                 delete = 'ds',         -- Delete surrounding
--                 find = 'sf',           -- Find surrounding (to the right)
--                 find_left = 'sF',      -- Find surrounding (to the left)
--                 highlight = 'sh',      -- Highlight surrounding
--                 replace = 'sr',        -- Replace surrounding
--                 update_n_lines = 'sn', -- Update `n_lines`
--
--                 suffix_last = 'l',     -- Suffix to search with "prev" method
--                 suffix_next = 'n',     -- Suffix to search with "next" method
--             },
--
--             -- Number of lines within which surrounding is searched
--             n_lines = 20,
--
--             -- Whether to respect selection type:
--             -- - Place surroundings on separate lines in linewise mode.
--             -- - Place surroundings on each line in blockwise mode.
--             respect_selection_type = false,
--
--             -- How to search for surrounding (first inside current line, then inside
--             -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
--             -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
--             -- see `:h MiniSurround.config`.
--             search_method = 'cover',
--
--             -- Whether to disable showing non-error feedback
--             silent = false,
--         },
--     },
--     {
--         "nvim-mini/mini.trailspace",
--         event = { "BufReadPost", "BufNewFile" },
--         config = function()
--             local miniTrailspace = require("mini.trailspace")
--
--             miniTrailspace.setup({
--                 only_in_normal_buffers = true,
--             })
--             vim.keymap.set("n", "<leader>cw", function() miniTrailspace.trim() end, { desc = "Erase Whitespace" })
--
--             -- Ensure highlight never reappears by removing it on CursorMoved
--             vim.api.nvim_create_autocmd("CursorMoved", {
--                 pattern = "*",
--                 callback = function()
--                     require("mini.trailspace").unhighlight()
--                 end,
--             })
--         end,
--     },
--     {
--         "mini-nvim/mini.splitjoin",
--         config = function()
--             local miniSplitJoin = require("mini.splitjoin")
--             miniSplitJoin.setup({
--                 mappings = { toggle = "" }, -- Disable default mapping
--             })
--             vim.keymap.set({ "n", "x" }, "sj", function() miniSplitJoin.join() end, { desc = "Join arguments" })
--             vim.keymap.set({ "n", "x" }, "sk", function() miniSplitJoin.split() end, { desc = "Split arguments" })
--         end,
--     },
-- }
}
