local splitr = function(line, ptrn)
	local from = 1
	local to = line:find(ptrn)
  
  if to == nil then
    return function()
      local out = line
      line = nil
      return out
    end
  end

	return function()
		local out = (line:sub(from, to - 1))
		if out == "" then
			return nil
		end

		from = to + 1
		to = line:find(ptrn, from) or #line + 1
		return out
	end
end

local getnum = function(word)
	if word == nil then
		return 0
	end
	local i = 1
	while true do
		local ltr = word:sub(i, i)
		if ltr == "" then
			break
		end

		if ltr:byte() >= 49 and ltr:byte() <= 57 then
			return ltr:byte() - 48
		end
		i = i + 1
	end
	return 0
end

function order(words)
	local iter = splitr(words, "%s")
	local ords = {}
	local word = iter()
	local wpos = 0

	while true do
		if word == nil then
			return table.concat(ords, " ")
		else
			wpos = getnum(word)
			if wpos > 0 then
				ords[wpos] = word
			end
		end
		word = iter()
	end
end

