--
-- Created by IntelliJ IDEA.
-- User: yaolongzhu
-- Date: 28/6/19
-- Time: 9:58 AM
-- To change this template use File | Settings | File Templates.
--
local Utils = require("Utils")

local gm_path = ngx.var.gm_path
local request_uri = ngx.var.request_uri;
local file = ngx.var.file;
local request_uri_split = splitStr(file, ",");

local origial_full_path = string.sub(request_uri_split[1],0, string.len(request_uri_split[1]) - string.len("/resize"))
local width = string.sub(request_uri_split[2], string.len("w_") +1, string.len(request_uri_split[2]))
local length = string.sub(request_uri_split[3], string.len("h_") +1, string.len(request_uri_split[3]))

Utils.printToNG(origial_full_path)
Utils.printToNG(width)
Utils.printToNG(length)


ngx.say("<p>hello, world, in Picture Server</p>")
ngx.say(ngx.var.uri)
Utils.printToNG(ngx.var.file)