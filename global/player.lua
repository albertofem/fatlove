Player = Tile:extend
{
	x = 400,
	y = 50,
	
	life = 3,
	 
	image = 'global/assets/graphics/player.png',

	jump = JumpingActor:extend
	{ 
		triggerKey = " ", sound = "global/assets/sounds/jump.wav" 
	},
	
	acceleration = {
		x = 0, 
		y = 600, 
		rotation = 0 
	},
	
	movement = MovingActor:new(),
	
	shooting = ShootingActor:extend
	{ 
		bullet = Bullet:new(),
		
		angle = 180
	},
	
	onUpdate = function(self)
		self.movement:onUpdate(self)
		self.jump:onUpdate(self)
		self.shooting:onUpdate(self)
		
		if(self.life <= 0) then
			self:die()
		end
	end,
	
	onCollide = function(self, other)
		self.jump:onCollide(self, other)
		
		if(other:instanceOf(Enemy)) then
			playSound("global/assets/sounds/hit.wav")
			self.life = self.life - 1
			self.x = self.x+35
		end
	end
}