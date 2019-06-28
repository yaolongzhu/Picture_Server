--
-- Created by IntelliJ IDEA.
-- User: yaolongzhu
-- Date: 28/6/19
-- Time: 9:58 AM
-- To change this template use File | Settings | File Templates.
--
local Utils = require("Utils")

ngx.say("<p>hello, world, in Picture Server</p>")
ngx.say(ngx.var.uri)
Utils.print(ngx.var.file)