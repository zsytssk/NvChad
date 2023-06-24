https://www.2n.pl/blog/how-to-make-ui-for-neovim-plugins-in-lua

`getqflist({'winid' : 0}).winid`

```lua
local function goto_definition(split_cmd)
	local util = vim.lsp.util
	local log = require("vim.lsp.log")
	local api = vim.api

	-- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
	local handler = function(_, result, ctx)
		if result == nil or vim.tbl_isempty(result) then
			local _ = log.info() and log.info(ctx.method, "No location found")
			return nil
		end

		local wc = 0
		local windows = vim.api.nvim_tabpage_list_wins(0)

		for _, v in pairs(windows) do
			local cfg = vim.api.nvim_win_get_config(v)
			local ft = vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(v), "filetype")

			if (cfg.relative == "" or cfg.external == false) and ft ~= "qf" then
				wc = wc + 1
			end
		end

		if result[1].uri ~= ctx.params.textDocument.uri and wc < 3 then
			vim.cmd(split_cmd)
		end

		util.jump_to_location(result[1], "utf-8")

		if #result > 1 then
			util.set_qflist(util.locations_to_items(result))
			api.nvim_command("copen")
			api.nvim_command("wincmd p")
		end
	end

	return handler
end

--split
local all_options = api.nvim_get_all_options_info()
local win_number = api.nvim_get_current_win()
local v = vim.wo[win_number]
local all_options = api.nvim_get_all_options_info()
local result = ""
for key, val in pairs(all_options) do
    if val.global_local == false and val.scope == "win" then
        result = result .. "|" .. key .. "=" .. tostring(v[key] or "<not set>")
    end
end
print(result)


local cur_win = vim.api.nvim_get_current_win()
-- do your windo, for example:
vim.cmd("windo if &buftype != 'nofile' | let g:non_float_total += 1 | endif")
vim.api.nvim_set_current_win(cur_win)


win_screenpos(window number)


打字练习: https://type-fu.com/app

-- insert lines
local new_start_pos = tool_sel.index_to_pos(buffer, new_start_index)
  local new_end_pos = tool_sel.index_to_pos(buffer, new_end_index)
  vim.api.nvim_buf_set_lines(buffer, new_start_pos[1] - 1, new_start_pos[1], false, text)
  print(vim.inspect { new_start_pos })
  tool_sel.set_selection(new_start_pos, new_end_pos)

```
