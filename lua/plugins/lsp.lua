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
        "vue-language-server",
      },
    },
  },

  -- LSP configuration for web development
  {
    "neovim/nvim-lspconfig",
    ft = { "html", "css", "scss", "javascript", "typescript", "javascriptreact", "typescriptreact", "vue", "svelte", "json", "jsonc" },
    opts = {
      servers = {
        -- Disable vue_ls since we're using vtsls with Vue plugin
        vue_ls = false,
        volar = false,
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
            "typescript",
            "typescriptreact",
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
              tsserver = {
                globalPlugins = {
                  {
                    configNamespace = "typescript",
                    enableForWorkspaceTypeScriptVersions = true,
                    languages = { "vue" },
                    location = vim.fn.stdpath("data")
                      .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
                    name = "@vue/typescript-plugin",
                  },
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
      setup = {
        vue_ls = function()
          return true -- Skip vue_ls setup
        end,
        volar = function()
          return true -- Skip volar setup
        end,
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