local M = {}
M.hardness = 10
M.mult = 0.4
M.columns = 0
M.rows = 0
M.tilesize = math.floor(64*M.mult)
M.scale = 1*M.mult

function M.world2tile(p)
	return vmath.vector3(math.floor((p.x+M.tilesize)/M.tilesize),
	math.floor((p.y+M.tilesize)/M.tilesize),0)
end
function M.tile2world(p)
	return vmath.vector3((p.x * M.tilesize)-(M.tilesize/2),
	(p.y * M.tilesize)-(M.tilesize/2),0)
end
return M