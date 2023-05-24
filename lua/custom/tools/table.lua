local M = {}

M.len = function(ta)
  local count = 0
  for _ in pairs(ta) do
    count = count + 1
  end
  return count
end

return M
