local solution = {}

local function primeFactors(n)
  local factors = {}
  n = n > 0 and n or 0 - n
  
  while n % 2 == 0 do
    factors[#factors + 1] = 2
    n = math.floor(n/2)
  end
  
  local root = math.sqrt(n)
  for i=3, root, 2 do
    while (n % i == 0) do
      factors[#factors + 1] = i
      n = math.floor(n / i)
    end
  end
  
  if n > 2 then
    factors[#factors + 1] = n
  end
  
  return factors
  
end

local function new_set()
  local set = {}
  return {
    add= function(t)
      for _, v in ipairs(t) do
        set[v] = true
      end
    end,
    get= function()
      local result = {} 
      for k, _ in pairs(set) do
        result[#result + 1] = k
      end
      
      table.sort(result)
      return result
    end,
  }
end


local function map(t, f)
  local result, len = {}, #t
  for i=1, len do result[i] = f(t[i]) end
  return result
end


function solution.sumOfDivided(lst)
    local result = {} -- returns a 2D table
  
    local unique = new_set()
    for _,num in ipairs(lst) do
      unique.add(primeFactors(num))
    end
  
    print(table.unpack(unique.get()))
  
    return map(unique.get(), function(fac)
      local sum, len = 0, #lst
      for i=1, len do
        if (lst[i] / fac) % 1 == 0 then
          sum = sum + lst[i]
        end
      end
      
      return {fac, sum}
    end)
  
end

return solution

