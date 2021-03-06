-- Generic class player

Player = ActorAnimation:extend
{
	actions = {},
	
	invincible = false,
	
	hit_points = 100,

	direction = "right",
	
	jumping = JumpingActor:new{ length = 400 },
	movement = MovingActor:new(),
	gravity = GravityAwareActor:new(),
	
	onNew = function(self)
		self:addAction(self.jumping)
		self:addAction(self.movement)
		self:addAction(self.gravity)
		self:addAction(self.attack)
		self:addAction(self.shooting)
		
		if self.onCustomNew then
			self:onCustomNew()
		end
		
		-- Global variable
		if not the.player then
			the.player = {}
		end
		
		the.player[self.id] = self
	end,
	
	onCollide = function(self, other, horizOverlap, vertOverlap)
		for index, action in pairs(self.actions) do
			if action.onCollide then action:onCollide(self, other, horizOverlap, vertOverlap) end
		end
		
		if self.onCustomCollide then
			self:onCustomCollide(other, horizOverlap, vertOverlap)
		end		
	end,
	
	onUpdate = function(self)
		for index, action in pairs(self.actions) do
			if action.onUpdate then action:onUpdate(self) end
		end
		
		if self.onCustomUpdate then
			self:onCustomUpdate()
		end
	end,
	
	addAction = function(self, action)
		table.insert(self.actions, action)
	end
}