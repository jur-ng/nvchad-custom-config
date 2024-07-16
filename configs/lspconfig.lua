local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

lspconfig.cssmodules_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    camelCase = true,
  },
}

lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    css = {
      lint = {
        validProperties = {
          "composes",
        },
      },
    },
  },
}

lspconfig.pylsp.setup {
  settings = {
    pylsp = {
      plugins = {
        flake8 = {
          enabled = true,
        },
      },
    },
  },
}

lspconfig.eslint.setup {
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
  capabilities = capabilities,
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
}

lspconfig.rust_analyzer.setup {
  settings = {
    ["rust-analyzer"] = {},
  },
}

-- if you just want default config for the servers then put them in a table
local servers = { "html", "clangd" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
