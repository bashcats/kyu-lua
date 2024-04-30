local solution = {}

function solution.zeros(n)
  local c = 0
  local i = 5
  while i<=n do
    c= c + n//i
    i= i * 5
  end
  return c
end

return solution

