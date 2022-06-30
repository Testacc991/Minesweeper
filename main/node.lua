local MyClass = {}
MyClass.__index = MyClass

function MyClass.new(pos)
	local self = setmetatable({},MyClass)
	self.state = true
	self.type = nil --mine,empty,flag
	self.pos = pos
	self.spawned = nil
	self.adjacent_vert = {}
	self.minesaround = 0
	return self
end
function MyClass:add_adjacent_vertex(new)
	table.insert(self.adjacent_vert, new)
	if new and new.type == "mine" then
		self.minesaround = self.minesaround + 1
	end
end
return MyClass