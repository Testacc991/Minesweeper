local MyClass = {}
MyClass.__index = MyClass

function MyClass.new(pos)
	local self = setmetatable({},MyClass)
	self.flagged = false
	self.state = false
	self.type = nil --mine,empty,flag
	self.pos = pos
	self.spawned = nil
	self.adjacent_vert = {}
	self.straight_adjacent_vert = {}
	self.minesaround = 0
	return self
end
function MyClass:add_adjacent_vertex(new)
	table.insert(self.adjacent_vert, new)
	if new and new.type == "mine" then
		self.minesaround = self.minesaround + 1
	end
end
function MyClass:add_straight_adjacent_vertex(new)
		table.insert(self.straight_adjacent_vert, new)
end
function MyClass:show_straight_adjacent_vertex()
	if self.type == "empty" and self.minesaround == 0  and not self.flagged then
		for i,v in pairs(self.straight_adjacent_vert) do
			if v.state == false and v.type == "empty" and not v.flagged then
				v.state = true
				v:show_straight_adjacent_vertex()
			end
		end
	end
end
function MyClass:show_adjacent_vertex()
	if self.type == "empty" and not self.flagged then
		for i,v in pairs(self.straight_adjacent_vert) do
			if v.type == "empty" and v.minesaround == 0 and not v.flagged then
				v.state = true
				v:show_straight_adjacent_vertex()
			elseif v.type == "empty" and not v.flagged then
				v.state = true
			end
		end
	end
end
return MyClass