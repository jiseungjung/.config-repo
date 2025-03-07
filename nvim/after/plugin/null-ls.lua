local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local timeout_ms = 5000
local excluded_paths = {
    "re%-store/shared/crayon",
    "re%-store/islands/xstudio/backend",
}

local async_formatting = function(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()

    vim.lsp.buf_request(
        bufnr,
        "textDocument/formatting",
        vim.lsp.util.make_formatting_params({ timeout_ms }),
        function(err, res, ctx)
            local client = vim.lsp.get_client_by_id(ctx.client_id)
            if client and client.name ~= "null-ls" then
                return -- Ignore responses from non-null-ls clients
            end

            if err then
                local err_msg = type(err) == "string" and err or err.message
                -- you can modify the log message / level (or ignore it completely)
                vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
                return
            end

            -- don't apply results if buffer is unloaded or has been modified
            if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
                return
            end

            if res then
                vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
                vim.api.nvim_buf_call(bufnr, function()
                    vim.cmd("silent noautocmd update")
                end)
            end
        end
    )
end

null_ls.setup({
  sources = {
      null_ls.builtins.code_actions.eslint,
      null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.formatting.eslint
  },
  on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePost", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                  local file_path = vim.api.nvim_buf_get_name(bufnr)
                  for _, pattern in ipairs(excluded_paths) do
                      if file_path:match(pattern) then return end
                  end
                  async_formatting(bufnr)
              end
          })
        end
  end
})

vim.keymap.set("n", "<leader>c", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>f", function()
    local bufnr = vim.api.nvim_get_current_buf()
    async_formatting(bufnr)
end)
