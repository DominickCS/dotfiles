return {
  "nvim-java/nvim-java",
  ft = "java", -- Only load for Java files
  config = function()
    require("java").setup({
      -- Root markers for project detection
      root_markers = {
        "pom.xml",
        "build.gradle",
        "mvnw",
        "gradlew",
        ".git",
      },

      -- Disable auto-installation
      notifications = {
        dap = false,
      },

      -- Java test configuration
      java_test = {
        enable = true,
        -- Don't auto-install, assume it's already installed
        auto_install = false,
      },

      -- Java debug adapter configuration
      java_debug_adapter = {
        enable = true,
        auto_install = false,
      },

      -- Spring Boot tools configuration
      spring_boot_tools = {
        enable = true,
        version = "1.59.0",
        auto_install = false,
      },

      -- JDTLS configuration
      jdtls = {
        enable = true,
        auto_install = false,
      },

      -- Lombok support
      lombok = {
        enable = true,
        auto_install = false,
      },
    })
  end,
  dependencies = {
    {
      "neovim/nvim-lspconfig",
      opts = {
        -- Remove the servers and setup sections - nvim-java handles this
        servers = {
          jdtls = {
            -- This will be handled by nvim-java
          },
        },
      },
    },
    {
      "mfussenegger/nvim-dap",
      optional = true,
    },
    {
      "JavaHello/spring-boot.nvim",
      optional = true,
    },
  },
}
