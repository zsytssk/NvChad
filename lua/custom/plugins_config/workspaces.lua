-- /Users/zsy/.local/share/nvim/
local workspaces = require "workspaces"
local sessions = require "sessions"
local close_buffers = require "close_buffers"
local utils = require "custom.plugins_config.utils"

sessions.setup {
  events = { "WinEnter", "VimLeavePre" },
  session_filepath = utils.sessions_path,
  absolute = true,
}

workspaces.setup {
  hooks = {
    open_pre = function()
      sessions.stop_autosave()
      close_buffers.wipe { type = "all", force = true }
    end,
    open = function()
      local cur_config = utils.get_cwd_workspaces_config()

      if utils.has_session(cur_config.name) then
        local session_filepath = utils.get_cwd_session_path()
        sessions.load(session_filepath, { autosave = true, silent = true })
      else
        utils.save_cur_session()
      end
      print("workspaces: open " .. cur_config.name)
    end,
  },
}

vim.schedule(function()
  local cur_config = utils.get_cwd_workspaces_config()
  if cur_config then
    workspaces.open(cur_config.name)
  end
end)
