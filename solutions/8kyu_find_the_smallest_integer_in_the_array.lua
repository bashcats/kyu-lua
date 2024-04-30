return function(t)
  local mathmin = math.min
  local function inner(t, i, min)
    return (t[i] == nil)
      and min
      or inner(t, i+1, mathmin(t[i], min))
  end
  
  return inner(t, 1, math.huge)
end
