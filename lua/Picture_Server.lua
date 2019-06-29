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
local working_dir = ngx.var.working_dir;

local file_split = Utils.splitStr(file, ",");
local request_uri_split = Utils.splitStr(request_uri, "/");

--原图全路径
local origial_full_path = string.sub(file_split[1],0, string.len(file_split[1]) - string.len("/resize"))
--宽
local width = string.sub(file_split[2], string.len("w_") +1, string.len(file_split[2]))
--高
local length = string.sub(file_split[3], string.len("h_") +1, string.len(file_split[3]))
--转换后图片全路径
local resize_full_path
--转换后图片文件夹全路径
local resize_dir_full_path = working_dir

--ngx.say(request_uri_split_length)

for i=2, #request_uri_split-1 do
    ngx.say(request_uri_split[i])
end

--Utils.printToNG(origial_full_path)
--Utils.printToNG(width)
--Utils.printToNG(length)

--原图不存在
if (not Utils.file_exists(origial_full_path)) then
    ngx.log(ngx.STDERR, origial_full_path .. "不存在")
    ngx.exit(ngx.HTTP_NOT_FOUND);
end

if(width~=nil and length~=nil) then

end

--ngx.say("<p>hello, world, in Picture Server</p>")
--ngx.say(ngx.var.uri)
--Utils.printToNG(ngx.var.file)