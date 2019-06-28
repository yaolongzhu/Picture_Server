--
-- Created by IntelliJ IDEA.
-- User: yaolongzhu
-- Date: 28/6/19
-- Time: 11:28 AM
-- To change this template use File | Settings | File Templates.
--

local M={};

function print(str)
    ngx.say(str)
end



M.print = print
return M

