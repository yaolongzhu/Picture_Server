local Utils = require("Utils")

local gm_path = ngx.var.gm_path
local request_uri = ngx.var.request_uri;
local file = ngx.var.file;
local working_dir = ngx.var.working_dir;

local file_split = Utils.splitStr(file, ",");
local request_uri_split = Utils.splitStr(request_uri, "/");

local pic_split = Utils.splitStr(request_uri_split[#request_uri_split-1],".")

--原图全路径
local origial_full_path = string.sub(file_split[1],0, string.len(file_split[1]) - string.len("/resize"))
--宽
local width = string.sub(file_split[2], string.len("w_") +1, string.len(file_split[2]))
--高
local length = string.sub(file_split[3], string.len("h_") +1, string.len(file_split[3]))
--转换后图片全路径
local resize_full_path
local resize_pic_name = pic_split[1] .. "_" .. file_split[2] .. "_" .. file_split[3] .. "." .. pic_split[2]
--转换后图片文件夹全路径
local resize_dir_full_path = working_dir .. "/thumbnails/"
local resize_url = "/thumbnails/"


for i=2, #request_uri_split-2 do
    resize_dir_full_path = resize_dir_full_path .. request_uri_split[i] .. "/"
    resize_url = resize_url .. request_uri_split[i] .. "/"
end

resize_full_path = resize_dir_full_path .. resize_pic_name
resize_url = resize_url .. resize_pic_name


--缩略图存在
--返回
if (Utils.file_exists(resize_full_path)) then
    ngx.req.set_uri(resize_url);
    ngx.exit(ngx.OK);
end


--原图不存在
--报错
if (not Utils.file_exists(origial_full_path)) then
    ngx.log(ngx.STDERR, origial_full_path .. "不存在")
    ngx.exit(ngx.HTTP_NOT_FOUND);
end

--构建路径
if (not Utils.file_exists(resize_dir_full_path)) then
    Utils.create_directory(resize_dir_full_path)
end



if(width~=nil and length~=nil) then
    cmd = gm_path .. " convert -resize " .. width .. "x" .. width .. " " .. origial_full_path .. " " .. resize_full_path
    ngx.log(ngx.STDERR, cmd)
    os.execute(cmd);
    ngx.req.set_uri(resize_url);
    ngx.exit(ngx.OK);
end
