local solution = {}

function solution.make_readable(seconds)
  local tm, th = 60, 3600
  local hrs = math.floor(seconds/th)
  local zpad = function(nmr)
    if nmr < 10 then return '0' .. tostring(nmr) else return tostring(nmr) end
  end
  seconds = seconds - th * hrs
  local mins = math.floor(seconds/tm) 
  seconds = seconds - tm * mins
  return zpad(hrs) .. ':' .. zpad(mins) .. ':' .. zpad(seconds)
end

return solution

