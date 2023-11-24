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

-- if you just want default config for the servers then put them in a table
local servers = { "html", "tsserver", "clangd" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
