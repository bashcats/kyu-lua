local solution = {}

function raise(n, r)
  local ogn = n
  local out = 0
  
  for i = 1, r do
    out = out + n
    n = n + ogn 
  end
  return out
end

function solution.solution(value)
  value = value - 1;
  local fifteens = math.floor(value / 15);
  local fives = math.floor(value / 5);
  local threes = math.floor(value / 3);
  return raise(5, fives) + raise(3, threes) - raise(15, fifteens);
end

return solution

