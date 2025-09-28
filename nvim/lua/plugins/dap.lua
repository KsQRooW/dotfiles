return {
  { "mfussenegger/nvim-dap-python" },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()
      require("dap-python").setup("python")

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.float_element("console", { position = "center", height = 20, width = 120 })
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.float_element("console", { position = "center", height = 20, width = 120 })
      end

      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "current file",
          program = "${file}",
          pythonPath = function()
            return "python"
          end,
          env = {
            PYTHONPATH = "${workspaceFolder}",
          },
          console = "integratedTerminal",
          justMyCode = false,
        },
        {
          type = "python",
          request = "launch",
          name = "pytest",
          module = "pytest",
          pythonPath = function()
            return "python"
          end,
          args = {
            "-x",
            "--log-level=INFO",
          },
          env = {
            PYTHONPATH = "${workspaceFolder}",
          },
          console = "integratedTerminal",
          justMyCode = false,
        },
      }
    end,
  },
}
