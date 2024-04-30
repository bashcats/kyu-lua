local solution = {}

function angle_type(a, b, c)
  local hyp = math.sqrt(a * a + b * b)
  if c == hyp then
    return 2
  elseif c > hyp then
    return 3
  else
    return 1
  end
end

function solution.triangle_type(a, b, c)
  local abc = {a,b,c}; table.sort(abc);
  if abc[1] + abc[2] <= abc[3] then return 0 end
  local ab = angle_type(a,b,c)
  if ab > 1 then return ab end
  ab = angle_type(b,c,a)
  if ab > 1 then return ab end
  ab = angle_type(c,a,b)
  if ab > 1 then return ab end
  return 1
end

return solution

