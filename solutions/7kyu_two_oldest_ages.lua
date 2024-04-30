local t = {}

local function lohi(a, b)
  if a > b then
    return b, a
  end
  
  return a, b
end

function t.twoOldestAges(ages)
  local a1, a2 = lohi(ages[1], ages[2])
  for i=3, #ages do
    if ages[i] > a1 then
      a1, a2 = lohi(a2, ages[i])
    end
  end
  
  return {a1, a2}
end

return t
