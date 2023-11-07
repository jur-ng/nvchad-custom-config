local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local b = null_ls.builtins

local postcss_formatter = {
  name = "postcss",
  method = null_ls.methods.FORMATTING,
  filetypes = { "css" },
  generator = null_ls.generator {
    command = "postcss",
    args = { "--stdin" },
    to_stdin = true,
    on_output = function(params, done)
      done { { text = params.output } }
    end,
  },
}

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown" } }, -- so prettier works only on these filetypes,
  postcss_formatter,
  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
