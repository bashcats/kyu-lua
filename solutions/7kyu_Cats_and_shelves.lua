local j = {}
function j.cats(start, finish)
  local intrvl = finish-start;
  local thirds = math.floor(intrvl / 3);
  intrvl = intrvl - (3 * thirds);
  return thirds + intrvl;
end
return j

