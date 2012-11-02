-- Generic class player

Player = Actor:extend
{
	jumping = JumpingActor:new(),
	
	movement = MovingActor:new(),
	
	gravity = GravityAwareActor:new(),
	
	attack = AttackingActor:new(),
	
	shooting = ShootingActor:new(),
	
	onNew = function(self)
		self:addAction(self.jumping)
		self:addAction(self.movement)
		self:addAction(self.gravity)
		self:addAction(self.attack)
		self:addAction(self.shooting)
	end
}