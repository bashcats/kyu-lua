local solution = {}

function solution.valid_ISBN10(isbn)
  if #isbn ~= 10 then return false end
  local function sum(tbl, o, i) o=o or 0; i=i or 1;
    if tbl[i] == nil then return o
    else return sum(tbl, o+tbl[i], i+1) end
  end
  local function iffen(v2, v1, fn)
    if v2 == nil then return nil
    else return fn(v1, v2) end
  end
  local function zipp(t1, t2, fn) local o={};
    for i=1, #t1 do o[i] = iffen(t2[i], t1[i], fn) end
    return o
  end
  local function pars(str) local o={};
    if tonumber(str:sub(1,9)) == nil or (str:sub(1,10) == nil and str:sub(10,10) ~= 'X') then return nil end
    for i=1, 10 do o[i] = tonumber(str:sub(i,i)) end
    if str:sub(10,10) == 'X' then o[10] = 10 end
    return o
  end
  
  pars=pars(isbn); if pars==nil then return false end
  return sum(zipp(
    pars,
    (function(n)local o={}; for i=1,n do o[i]=i end return o end)(10),
    function(a,b)return a*b end
    )) % 11 == 0;
end

return solution

