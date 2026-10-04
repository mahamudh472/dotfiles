return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "mfussenegger/nvim-dap-python",
        },

        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup()

            -- Open UI when debugging starts
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end

            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end

            -- Close UI when debugging ends
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end

            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            -- Python debugger
            require("dap-python").setup(
                vim.fn.stdpath("data")
                    .. "/mason/packages/debugpy/venv/bin/python"
            )

            -- Breakpoint signs
            vim.fn.sign_define("DapBreakpoint", {
                text = "●",
                texthl = "DiagnosticSignError",
            })

            vim.fn.sign_define("DapStopped", {
                text = "▶",
                texthl = "DiagnosticSignWarn",
                linehl = "DapStoppedLine",
            })

            -- Keymaps
            vim.keymap.set("n", "<F5>", dap.continue, {
                desc = "Debug: Continue",
            })

            vim.keymap.set("n", "<F10>", dap.step_over, {
                desc = "Debug: Step Over",
            })

            vim.keymap.set("n", "<F11>", dap.step_into, {
                desc = "Debug: Step Into",
            })

            vim.keymap.set("n", "<F12>", dap.step_out, {
                desc = "Debug: Step Out",
            })

            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {
                desc = "Debug: Toggle Breakpoint",
            })

            vim.keymap.set("n", "<leader>dB", function()
                dap.set_breakpoint(
                    vim.fn.input("Breakpoint condition: ")
                )
            end, {
                desc = "Debug: Conditional Breakpoint",
            })

            vim.keymap.set("n", "<leader>du", dapui.toggle, {
                desc = "Debug: Toggle UI",
            })

            vim.keymap.set("n", "<leader>dr", dap.repl.open, {
                desc = "Debug: REPL",
            })
        end,
    },
}
