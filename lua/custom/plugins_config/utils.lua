local sessions = require "sessions"
local workspaces_utils = require "workspaces.util"
local M = {}

local sessions_path = vim.fn.stdpath "data" .. "/sessions"

M.scan_dir = function(directory)
  local i, t, popen = 0, {}, io.popen
  local pfile = popen('ls -a "' .. directory .. '"')

  if pfile == nil then
    return nil
  end

  for filename in pfile:lines() do
    i = i + 1
    t[i] = filename
  end

  pfile:close()
  return t
end

M.get_current_cwd = function()
  return vim.fn.getcwd()
end

M.serialize_table = function(val, name, skipnewlines, depth)
  skipnewlines = skipnewlines or false
  depth = depth or 0

  local tmp = string.rep(" ", depth)

  if name then
    tmp = tmp .. name .. " = "
  end

  if type(val) == "table" then
    tmp = tmp .. "{" .. (not skipnewlines and "\n" or "")

    for k, v in pairs(val) do
      tmp = tmp .. M.serialize_table(v, k, skipnewlines, depth + 1) .. "," .. (not skipnewlines and "\n" or "")
    end

    tmp = tmp .. string.rep(" ", depth) .. "}"
  elseif type(val) == "number" then
    tmp = tmp .. tostring(val)
  elseif type(val) == "string" then
    tmp = tmp .. string.format("%q", val)
  elseif type(val) == "boolean" then
    tmp = tmp .. (val and "true" or "false")
  else
    tmp = tmp .. '"[inserializeable datatype:' .. type(val) .. ']"'
  end

  return tmp
end

M.get_cwd_workspaces_config = function()
  local workspaces = require "workspaces"
  local workspaces_config = workspaces.get()
  local current_foler_name = workspaces_utils.path.basename(M.get_current_cwd())
  for _, v in pairs(workspaces_config) do
    if v["name"] == current_foler_name then
      return v
    end
  end
end

M.get_cwd_session_path = function()
  local cur_config = M.get_cwd_workspaces_config()
  if cur_config then
    return sessions_path .. "/" .. cur_config.name .. ".session"
  end
end

M.save_cur_session = function()
  local cur_config = M.get_cwd_workspaces_config()
  if cur_config == nil then
    return false
  end
  local has_session = M.has_session(cur_config.name)
  if has_session then
    return false
  end
  local session_path = M.get_cwd_session_path()
  sessions.save(session_path)
  return true
end

M.get_sessions_list = function()
  local directory = vim.fn.stdpath "data" .. "/sessions"
  local list = M.scan_dir(directory)
  return list
end

M.has_session = function(name)
  local list = M.get_sessions_list()
  if list == nil then
    return false
  end
  for _, v in pairs(list) do
    if v == name .. ".session" then
      return true
    end
  end
  return false
end

return M
