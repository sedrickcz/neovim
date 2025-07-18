return {
  -- Mason for managing LSP servers, formatters, and linters
  {
    "williamboman/mason.nvim",
    version = "v2.0.0",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "tailwindcss-language-server",
        "eslint-lsp",
        "prettier",
        "vtsls",
      },
    },
  },

  -- LSP configuration for web development
  {
    "neovim/nvim-lspconfig",
    ft = { "html", "css", "scss", "javascript", "typescript", "javascriptreact", "typescriptreact", "vue", "svelte", "json", "jsonc" },
    opts = {
      servers = {
        -- Tailwind CSS LSP
        tailwindcss = {
          settings = {
            tailwindCSS = {
              classAttributes = { "class", "className", "classList", "ngClass" },
              lint = {
                cssConflict = "warning",
                invalidApply = "error",
                invalidConfigPath = "error",
                invalidScreen = "error",
                invalidTailwindDirective = "error",
                invalidVariant = "error",
                recommendedVariantOrder = "warning",
              },
              validate = true,
            },
          },
        },
        -- ESLint LSP
        eslint = {
          settings = {
            codeAction = {
              disableRuleComment = {
                enable = true,
                location = "separateLine",
              },
              showDocumentation = {
                enable = true,
              },
            },
            codeActionOnSave = {
              enable = false,
              mode = "all",
            },
            format = true,
            nodePath = "",
            onIgnoredFiles = "off",
            packageManager = "npm",
            quiet = false,
            rulesCustomizations = {},
            run = "onType",
            useESLintClass = false,
            validate = "on",
            workingDirectory = {
              mode = "location",
            },
          },
        },
        -- vtsls (Vue TypeScript Language Server)
        vtsls = {
          filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
            "vue",
          },
          settings = {
            complete_function_calls = true,
            vtsls = {
              enableMoveToFileCodeAction = true,
              autoUseWorkspaceTsdk = true,
              experimental = {
                completion = {
                  enableServerSideFuzzyMatch = true,
                },
              },
            },
            typescript = {
              updateImportsOnFileMove = { enabled = "always" },
              suggest = {
                completeFunctionCalls = true,
              },
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = { enabled = false },
              },
              preferences = {
                includePackageJsonAutoImports = "auto",
              },
            },
            javascript = {
              updateImportsOnFileMove = { enabled = "always" },
              suggest = {
                completeFunctionCalls = true,
              },
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = { enabled = false },
              },
              preferences = {
                includePackageJsonAutoImports = "auto",
              },
            },
          },
          on_attach = function(client, bufnr)
            client.server_capabilities.documentHighlightProvider = false
          end,
        },
      },
    },
  },

  -- Prettier formatting
  {
    "stevearc/conform.nvim",
    ft = { "html", "css", "scss", "javascript", "typescript", "javascriptreact", "typescriptreact", "vue", "svelte", "json", "jsonc", "markdown" },
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        vue = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        markdown = { "prettier" },
      },
    },
  },
}