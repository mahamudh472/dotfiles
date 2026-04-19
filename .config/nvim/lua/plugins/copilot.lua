return {
        {
                "zbirenbaum/copilot.lua",
                cmd = "Copilot",
                event = "InsertEnter",
                config = function()
                        require("copilot").setup({
                        suggestion = {
                                enabled = true,
                                auto_trigger = true,
                                keymap = {
                                        accept = "<C-l>",
                                next = "<M-]>",
                                prev = "<M-[>",
                                dismiss = "<C-]>",
                                },
                        },
                        panel = { enabled = false },
                })
            end,
        },
        {
            "CopilotC-Nvim/CopilotChat.nvim",
            dependencies = {
                { "zbirenbaum/copilot.lua" },
                { "nvim-lua/plenary.nvim" },
            },
            opts = {
                model = "claude-sonnet-4-5",  -- or gpt-4o
                window = {
                    layout = "vertical",  -- opens a chat split
                },
            },
            keys = {
                { "<leader>cc", "<cmd>CopilotChat<cr>", desc = "Copilot Chat" },
                { "<leader>ce", "<cmd>CopilotChatExplain<cr>", desc = "Explain Code" },
                { "<leader>cf", "<cmd>CopilotChatFix<cr>", desc = "Fix Code" },
            },
        }
}
