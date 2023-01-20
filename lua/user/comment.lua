local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	return
end

comment.setup {
	-- pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
	--[[ post_hook = function(ctx) ]]
	--[[ 	if ctx.range.srow == ctx.range.erow then ]]
	--[[ 		-- do something with the current line ]]
	--[[ 	else ]]
	--[[ 		-- do something with lines range ]]
	--[[ 	end ]]
	--[[ end, ]]
	--[[ pre_hook = function(ctx) ]]
	--[[   local U = require "Comment.utils" ]]
	--[[]]
	--[[   local location = nil ]]
	--[[   if ctx.ctype == U.ctype.block then ]]
	--[[     location = require("ts_context_commentstring.utils").get_cursor_location() ]]
	--[[   elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then ]]
	--[[     location = require("ts_context_commentstring.utils").get_visual_start_location() ]]
	--[[   end ]]
	--[[]]
	--[[   return require("ts_context_commentstring.internal").calculate_commentstring { ]]
	--[[     key = ctx.ctype == U.ctype.line and "__default" or "__multiline", ]]
	--[[     location = location, ]]
	--[[   } ]]
	--[[ end, ]]
}
