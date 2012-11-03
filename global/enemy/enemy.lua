Enemy = Tile:extend
{
    scoreboard_hit_points = 0,
    scoreboard_die_points = 0,
    
    actions = {},
	
	invincible = false,
	
	hit_points = 100,
    
    collisionable = true,
	
	gravity = GravityAwareActor:new(),
	
	onNew = function(self)
		self:addAction(self.gravity)
		
		if self.onCustomNew then
			self:onCustomNew()
		end
	end,
	
	onCollide = function(self, other, horizOverlap, vertOverlap)
		for index, action in pairs(self.actions) do
			if action.onCollide then action:onCollide(self, other, horizOverlap, vertOverlap) end
		end
	end,
	
	onUpdate = function(self)
		for index, action in pairs(self.actions) do
			if action.onUpdate then action:onUpdate(self) end
		end
	end,
	
	addAction = function(self, action)
		table.insert(self.actions, action)
	end
}