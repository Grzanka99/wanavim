local function captureShell(cmd, array)
	local f = assert(io.popen(cmd, "r"))
	local s = assert(f:read("*a"))
	f:close()
	if array then
		local lines = {}
		for l in s:gmatch("[^\r\n]+") do
			table.insert(lines, l)
		end
		return lines
	end
	return s
end

return captureShell
