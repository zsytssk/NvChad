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

M.insert_cur_time = function()
  local mode = vim.fn.mode()
  local text = vim.fn.strftime "%Y-%m-%d %H:%M:%S"
  vim.api.nvim_put({ text }, "c", mode == "n", true)
end

M.test = function()
  local mode = vim.fn.mode()

  local buffer = vim.api.nvim_get_current_buf()
  local tool_sel = require "custom.tools.selection"

  local selection = tool_sel.get_select_region()
  local text = tool_sel.get_select_text(buffer, selection)
  local start_index = tool_sel.pos_to_index(buffer, selection[1], false)
  local end_index = tool_sel.pos_to_index(buffer, selection[2], mode == "V")
  local new_start_index = end_index + 1
  local new_end_index = new_start_index + end_index - start_index
  if mode == "V" then
    table.insert(text, "")
    vim.api.nvim_win_set_cursor(0, { selection[2][1] + 1, 1 })
  end
  print(vim.inspect { new_start_index, new_end_index, text })
  vim.api.nvim_put(text, "c", true, false)
  local new_start_pos = tool_sel.index_to_pos(buffer, new_start_index)
  local new_end_pos = tool_sel.index_to_pos(buffer, new_end_index)
  tool_sel.set_selection(new_start_pos, new_end_pos)

  if mode == "V" then
    vim.api.nvim_input "V"
  end
  -- print(vim.inspect { text, selection, new_end_pos })
  -- print(vim.inspect(selection))
  -- print(vim.inspect { start_pos,end_pos })
end

return M
