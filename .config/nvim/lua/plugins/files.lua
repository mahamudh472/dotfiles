return {
        "echasnovski/mini.files",
        config = function()
            local MiniFiles = require("mini.files")

            MiniFiles.setup({
                mappings = {
                    close = "q",
                    go_in_plus = "l",
                    go_out = "h",
                    go_out_plus = "",
                    reset = "<bs>",
                    reveal_cwd = "@",
                    show_help = "g?",
                    synchronize = "<c-s>",
                    trim_left = "<",
                    trim_right = ">",
                },
                windows = {
                    preview = false,
                    width_focus = 25,
                    width_preview = 30,
                    width_nofocus = 20,
                },
            })

            local function dynamic_open(path)
                MiniFiles.open(path, true, {})
            end

            vim.keymap.set("n", "<leader>e", function()
                if not MiniFiles.close() then
                    dynamic_open(".")
                end
            end, { desc = "Open file browser" })
            vim.keymap.set("n", "-", function()
                dynamic_open(vim.api.nvim_buf_get_name(0))
                MiniFiles.reveal_cwd()
            end, { desc = "Open file browser" })

            local files_set_cwd = function()
                local cur_entry_path = MiniFiles.get_fs_entry().path
                local cur_directory = vim.fs.dirname(cur_entry_path)
                if vim.fn.chdir(cur_directory) ~= "" then
                    print("Current directory set to " .. cur_directory)
                else
                    print("Unable to set current directory")
                end
            end

            local minifiles_triggers = vim.api.nvim_create_augroup("MiniFilesMappings", { clear = true })

            vim.api.nvim_create_autocmd("User", {
                group = minifiles_triggers,
                pattern = "MiniFilesBufferCreate",
                callback = function(args)
                    local buf_id = args.data.buf_id
                    vim.keymap.set("n", "g.", files_set_cwd, { buffer = buf_id, desc = "Set CWD" })
                end,
            })
        end,
    }
