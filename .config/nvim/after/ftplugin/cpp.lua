local g = vim.g
local o = vim.o
local api = vim.api

local au = require("au")
--
-- au {{ 'BufNewFile', 'BufRead' },{
-- 	'.cpp, .cc',
-- 	function()
-- 		o.expandtab = true,
-- 		o.tabstop = 2
-- 		o.shiftwidth = 2
-- }}
