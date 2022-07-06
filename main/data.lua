local M = {}
M.hardness = 10
M.mult = 0.4
M.columns = 19
M.rows = 19
M.tilesize = math.floor(64*M.mult)
M.scale = 1*M.mult
M.map_width = M.tilesize * M.rows
M.map_height = M.tilesize * M.columns
M.window_width, M.window_height = window.get_size()
M.shift_x = (M.window_width - M.map_width)/2
M.shift_y = (M.window_height - M.map_height)/2*0.66666
function M.world2tile(p)
	return vmath.vector3(math.floor((p.x+M.tilesize-M.shift_x)/M.tilesize),
	math.floor((p.y+M.tilesize-M.shift_y)/M.tilesize),0)
end
function M.tile2world(p)
	return vmath.vector3((p.x * M.tilesize)-(M.tilesize/2)+M.shift_x,
	(p.y * M.tilesize)-(M.tilesize/2)+M.shift_y,0)
end

return M