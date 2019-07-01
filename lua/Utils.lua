
local M={};

function printToNG(str)
    ngx.say(str)
end

function splitStr(str, reps)
    local r = {};
    if (str == nil) then return nil; end
    string.gsub(str, "[^"..reps.."]+", function(w) table.insert(r, w) end);
    return r;
end

function file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then io.close(f) return true else return false end
end

function create_directory(directory)
    local cmd = "mkdir -p " .. directory
    os.execute(cmd)
end

--srcStr = "/thumbnails/aergegre/test.jpg/resize,w_200,h_300"
--splitByStr = ","
--splitResult = splitStr(srcStr, splitByStr);

--print(splitResult[1])
--print( string.sub(splitResult[1],0, string.len(splitResult[1]) - string.len("/resize")) )
--print( string.sub(splitResult[2], string.len("w_") +1, string.len(splitResult[2])) )
--print( string.sub(splitResult[3], string.len("h_") +1, string.len(splitResult[3])) )


--print(string.sub(srcStr, 0, string.len(srcStr)-findLastIndex(srcStr, "/")))


M.printToNG = printToNG
M.splitStr = splitStr
M.file_exists = file_exists
M.create_directory = create_directory
return M

