local M = {}

M.toggle_wrap = function()
  if vim.wo.wrap == false then
    vim.wo.wrap = true
  else
    vim.wo.wrap = false
  end
end

M.organize_imports = function(buffer)
  -- gets the current bufnr if no bufnr is passed
  if not buffer then
    buffer = vim.api.nvim_get_current_buf()
  end

  -- params for the request
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(buffer) },
    title = "",
  }

  -- perform a syncronous request
  -- 500ms timeout depending on the size of file a bigger timeout may be needed
  vim.lsp.buf_request_sync(buffer, "workspace/executeCommand", params, 500)
end

return M
