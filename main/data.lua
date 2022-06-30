local M = {}
M.tilesize = 66
M.shift = 50
M.scale = 1
function M.tile2world(pos)
	return pos * M.tilesize * M.scale
end
function M.world2tile(pos)
	return math
end

return M