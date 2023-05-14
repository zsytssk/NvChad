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

-- local function visual_selection_range()
--   local _, csrow, cscol, _ = unpack(vim.fn.getpos "'<")
--   local _, cerow, cecol, _ = unpack(vim.fn.getpos "'>")
--   if csrow < cerow or (csrow == cerow and cscol <= cecol) then
--     return csrow - 1, cscol - 1, cerow - 1, cecol
--   else
--     return cerow - 1, cecol - 1, csrow - 1, cscol
--   end
-- end
--
-- M.get_select_region = function()
--   local line1 = vim.api.nvim_buf_get_mark(0, "<")
--   local line2 = vim.api.nvim_buf_get_mark(0, ">")
--   local line3 = vim.fn.getpos "v"
--   print("test1" .. vim.inspect(line1))
--   print("test2" .. vim.inspect(line2))
-- end
M.get_select_region = function()
  vim.cmd 'noau normal! "vy"'

  print(vim.inspect(vim.fn.getreg "v"))
end
M.test = M.get_select_region

return M
