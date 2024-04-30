local solution = {}

function fmap(tbl, fn)
  local out = {}
  for i,v in ipairs(tbl) do
    out[i] = fn(v)
  end
  return out
end

function splt(str, sep)
  if sep == nil then sep = "%s" end
  local t = {}
  
  for word in string.gmatch(str, "([^"..sep.."]+)") do
    table.insert(t, word)
  end
  t[#t] = t[#t]:gsub('%s', '')
  return t
end

function solution.generate_hashtag(s)
  if s == "" then return false end
  local out = "#" .. table.concat(fmap(splt(s), function(word)
    return string.upper(word:sub(1,1)) .. string.lower(word:sub(2,#word))
  end), '')
  if #out > 140 then
    return false
  end
  return out
end

return solution

