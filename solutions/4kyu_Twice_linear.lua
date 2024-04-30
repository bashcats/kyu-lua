local solution = {}

function solution.dblLinear(n)
  local u = {1}; local x, y = 1, 1;
  for i=1, n do
    local nxtX = 2 * u[x] + 1;
    local nxtY = 3 * u[y] + 1;
    if (nxtX <= nxtY) then
      table.insert(u, nxtX);
      x = x + 1;
      if (nxtX == nxtY) then
        y = y + 1;
      end
    else
      table.insert(u, nxtY);
      y = y + 1;
    end
  end
  
  return u[n+1];
end

return solution

