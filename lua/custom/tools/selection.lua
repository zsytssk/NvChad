local tool_str = require "custom.tools.str"
local M = {}

M.get_select_region = function()
  local mode = vim.fn.mode()
  local s1 = vim.fn.getcharpos "v"
  local e1 = vim.fn.getcharpos "."
  local s2, e2 = unpack(M.normal_range({ s1[2], s1[3] }, { e1[2], e1[3] }))
  if mode == "V" then
    s2[2] = 1
    local ev_end = vim.fn.strlen(vim.fn.getline(e2[1])) + 1
    if ev_end > e2[2] then
      e2[2] = ev_end
    end
  end
  return { s2, e2 }
end

-- 处理 选区颠倒的问题
M.normal_range = function(s, e)
  if s[1] > e[1] then
    return { e, s }
  end
  if s[1] == e[1] and s[2] > e[2] then
    return { e, s }
  end
  return { s, e }
end

M.set_selection = function(s, e)
  vim.cmd ':normal! v"_y'
  vim.fn.setcharpos("'<", { 0, s[1], s[2], 0 })
  vim.fn.setcharpos("'>", { 0, e[1], e[2], 0 })
  vim.cmd ":normal! gv"
end

M.get_select_text = function(buffer, range)
  local s = range[1]
  local e = range[2]
  local text = {}
  for i = s[1], e[1] do
    local line_str = vim.api.nvim_buf_get_lines(buffer, i - 1, i, false)[1]
    local line_len = tool_str.len(line_str)
    if i < e[1] then
      table.insert(text, line_str)
    else
      local si = 1
      if i == s[1] then
        si = s[2]
      end
      local ei = e[2]
      if ei > line_len then
        ei = line_len
      end
      print(vim.inspect { ei, line_len })
      local str = tool_str.sub_str(line_str, si, ei)
      table.insert(text, str)
    end
  end
  return text
  -- return vim.api.nvim_buf_get_text(buffer, s[1] - 1, s[2] - 1, e[1] - 1, e[2], {})
end

-- 将坐标位置转化为 整个文本的index
M.pos_to_index = function(buffer, pos)
  local cur_line = pos[1]
  local cur_col = pos[2]
  local lines = vim.api.nvim_buf_get_lines(buffer, 0, cur_line, false)
  local index = 0
  for i, v in pairs(lines) do
    if i < cur_line then
      index = index + string.len(v)
    else
      index = index + cur_col
    end
  end
  return index
end

-- 将index转化为坐标位置
M.index_to_pos = function(buffer, index)
  local buffer_lines = vim.api.nvim_buf_line_count(buffer)
  local move_index = 0
  for i = 1, buffer_lines do
    -- for i = 1, 1 do
    local line_str = vim.api.nvim_buf_get_lines(buffer, i - 1, i, false)[1]
    local line_len = string.len(line_str)
    local line_end_index = move_index + line_len
    if line_end_index >= index then
      return { i, index - move_index }
    end
    move_index = move_index + line_len
  end
end

return M
