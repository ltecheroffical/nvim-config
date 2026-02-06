local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local nl = function()
	return t({ "", "" })
end
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

return {
	s("err", fmt([[
		if {} != nil {{
			return {}
		}}]], { i(1, "err"), rep(1) })
	),
	s("errv", fmt([[
		if {} != nil {{
			return {}, {}
		}}]], { i(1, "err"), i(2, "nil"), rep(1) })
	),
	s("errbody", fmt([[
		if {} != nil {{
			{}
			return {}, {}
		}}]], { i(1, "err"), i(2, "log.Println(err)"), i(3, "nil"), rep(1) })
	),
	s("errweb", fmt([[
		if {} != nil {{
			{}.Println({})
			http.Error({}, {}, http.StatusInternalServerError)
			return
		}}]], { i(1, "err"), i(2, "log"), rep(1), i(3, "w"), i(4, "http.StatusText(http.StatusInternalServerError)") })
	),
	s("errfmt", fmt([[fmt.Errorf("{}: %s", {})]], { i(1, "msg"), i(2, "err") })),
}
