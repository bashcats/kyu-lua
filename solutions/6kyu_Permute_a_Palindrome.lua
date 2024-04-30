local solution = {}

function solution.permute_a_palindrome(input)
  local ilen = #input
  local byts = {}
  local nmru = 0 - #input % 2
  for i=1, #input do byts[i] = input:byte(i) end
  table.sort(byts)  
  
  local idx = 1
  while idx < ilen do
    if byts[idx] ~= byts[idx+1] then 
     if nmru == 0 then return false end
     idx = idx + 1
     nmru = nmru + 1
    else
      idx = idx + 2
    end
  end
  return true
end

return solution

