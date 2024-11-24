return {
  { "LazyVim/LazyVim", import = "lazyvim.plugins" },
  { import = "lazyvim.plugins.extras.dap.core" },
  { import = "lazyvim.plugins.extras.ui.mini-starter" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.tailwind" },
  { import = "plugins" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "html",
        "javascript",
        "json",
        "lua",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- tsserver will be automatically installed with mason and loaded with lspconfig
        tsserver = {
          enabled = false,
        },
        vtsls = {
          enabled = true,
          -- explicitly add default filetypes, so that we can extend
          -- them in related extras
          filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
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
            },
          },
        },
        eslint = {
          settings = {
            -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
            workingDirectories = { mode = "auto" },
          },
        },
      },
      config = function(_, opts)
        -- config blink.cmp to work better with nvim-lspconfig
        local lspconfig = require("lspconfig")
        for server, config in pairs(opts.servers or {}) do
          config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
          lspconfig[server].setup(config)
        end
      end,
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- eslint = function()
        --   local function get_client(buf)
        --     return LazyVim.lsp.get_clients({ name = "eslint", bufnr = buf })[1]
        --   end
        --
        --   local formatter = LazyVim.lsp.formatter({
        --     name = "eslint: lsp",
        --     primary = false,
        --     priority = 200,
        --     filter = "eslint",
        --   })
        --
        --   -- Use EslintFixAll on Neovim < 0.10.0
        --   if not pcall(require, "vim.lsp._dynamic") then
        --     formatter.name = "eslint: EslintFixAll"
        --     formatter.sources = function(buf)
        --       local client = get_client(buf)
        --       return client and { "eslint" } or {}
        --     end
        --     formatter.format = function(buf)
        --       local client = get_client(buf)
        --       if client then
        --         local diag = vim.diagnostic.get(buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
        --         if #diag > 0 then
        --           vim.cmd("EslintFixAll")
        --         end
        --       end
        --     end
        --   end
        --
        --   -- register the formatter with LazyVim
        --   LazyVim.format.register(formatter)
        -- end,
        vtsls = function(_, opts)
          LazyVim.lsp.on_attach(function(client, buffer)
            client.commands["_typescript.moveToFileRefactoring"] = function(command, ctx)
              ---@type string, string, lsp.Range
              local action, uri, range = unpack(command.arguments)

              local function move(newf)
                client.request("workspace/executeCommand", {
                  command = command.command,
                  arguments = { action, uri, range, newf },
                })
              end

              local fname = vim.uri_to_fname(uri)
              client.request("workspace/executeCommand", {
                command = "typescript.tsserverRequest",
                arguments = {
                  "getMoveToRefactoringFileSuggestions",
                  {
                    file = fname,
                    startLine = range.start.line + 1,
                    startOffset = range.start.character + 1,
                    endLine = range["end"].line + 1,
                    endOffset = range["end"].character + 1,
                  },
                },
              }, function(_, result)
                ---@type string[]
                local files = result.body.files
                table.insert(files, 1, "Enter new path...")
                vim.ui.select(files, {
                  prompt = "Select move destination:",
                  format_item = function(f)
                    return vim.fn.fnamemodify(f, ":~:.")
                  end,
                }, function(f)
                  if f and f:find("^Enter new path") then
                    vim.ui.input({
                      prompt = "Enter move destination:",
                      default = vim.fn.fnamemodify(fname, ":h") .. "/",
                      completion = "file",
                    }, function(newf)
                      return newf and move(newf)
                    end)
                  elseif f then
                    move(f)
                  end
                end)
              end)
            end
          end, "vtsls")
          -- copy typescript settings to javascript
          opts.settings.javascript =
            vim.tbl_deep_extend("force", {}, opts.settings.typescript, opts.settings.javascript or {})
        end,
      },
    },
  },
  {
    "folke/trouble.nvim",
    opts = {
      modes = {
        preview_float = {
          mode = "lsp",
          preview = {
            type = "float",
            relative = "editor",
            border = "rounded",
            title = "Preview",
            title_pos = "center",
            position = { 0, -2 },
            size = { width = 0.3, height = 0.3 },
            zindex = 200,
          },
        },
      },
    }, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
  },
}
