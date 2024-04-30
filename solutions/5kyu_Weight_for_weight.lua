local solution = {}
function solution.orderWeight(str)
  local function fmap(tbl, fn)
    local result = {}
    for i=1, #tbl do
      result[i] = fn(tbl[i])
    end
    return result
  end --\\fmap
  local function split(s, sep)
    sep = sep or " "
    local result = {}
    local pattern = string.format("([^%s]+)", sep)
    string.gsub(s, pattern, function(c) result[#result + 1] = c end)
    return result
  end --\\split
  local function chars(s)
    local result = {}
    for i=1, #s do
      result[i] = s:sub(i,i)
    end
    return result
  end --\\chars
  local function sum(tbl)
    local total = 0
    for i=1, #tbl do
      total = total + tbl[i]
    end
    return total
  end --\\sum
  local function wrepr(str)
    local result = {}
    result.s = str
    result.n = tonumber(str)
    result.w = sum(fmap(chars(str), tonumber))
    return result
  end --\\wrepr
  
  local weights = fmap(split(str, " "), wrepr)
  table.sort(weights, function(a,b)
      if a.w == b.w then
        return a.s < b.s
      else
        return a.w < b.w
      end
  end)
  return table.concat(fmap(weights, function(a) return a.s end), " ")
end
return solution

