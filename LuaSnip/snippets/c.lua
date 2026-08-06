local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function make_guard()
	local filepath = vim.fn.expand('%:p')
	local from_src = filepath:match('[/\\]src[/\\](.+)$') or filepath:match('[^/\\]+$')
	local guard = (from_src or '')
		:upper()
		:gsub('[^%w]+', '_')
		:gsub('^_+', '')
		:gsub('_+$', '')
	return guard .. '_'
end

return {
	s("#guard", {
		f(function() return "#ifndef " .. make_guard() end),
		t({ "", "#define " }),
		f(function() return make_guard() end),
		t({ "", "", "" }),
		i(0),
		t({ "", "", "#endif // " }),
		f(function() return make_guard() end),
	}),

	s("#pguard", {
		t("#pragma once"),
	}),

}
