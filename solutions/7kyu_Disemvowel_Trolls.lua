kata = {}

function kata.disemvowel(s) local o={}
  local vc= 0
  for i=1,#s do local c=s:sub(i,i)
    if ('aeiouAEIOU'):find(c)==nil then
      o[i-vc] = c
    else vc= 1+vc end
  end
  return table.concat(o)
end

return kata

