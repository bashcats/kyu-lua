
cal kata = {}

function kata.dirReduc(dir)
  dir = table.concat(dir)
  local prev = '';
  while (prev ~= dir) do
    prev = dir
    dir = dir:gsub("NORTHSOUTH", ""):gsub("SOUTHNORTH", ""):gsub("WESTEAST", ""):gsub("EASTWEST", "")
  end
  return (function(ln)
    local out = {}
    local idx = 1
    local dirs = {"WEST", "NORTH", "EAST", "SOUTH"}
    local function rc(i)
      local nesw = ln:sub(i, i)
      if nesw == '' then return end
      for _, v in pairs(dirs) do if v:sub(1,1) == nesw then
        out[#out+1] = v
        rc(i+#v); break
      end end
    end
    rc(1); return out;
  end)(dir)
end

return kata

