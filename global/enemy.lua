Enemy = Tile:extend
{
	x = 300,
	y = 240,
	
	life = 3,

	image = 'global/assets/graphics/soldier.png',
	
	jump = JumpingActor:extend
	{ 
		triggerKey = " ", sound = "global/assets/sounds/jump.wav" 
	},
	
	acceleration = {
		x = 0, 
		y = 600, 
		rotation = 0 
	},
	
	onUpdate = function(self)
		self.jump:onUpdate(self)
		
		if(self.life <= 0) then
			self:die()
		end
	end,
	
	onCollide = function(self, other)
		self.jump:onCollide(self, other)
		
		if(other:instanceOf(Bullet)) then
			playSound("global/assets/sounds/hit.wav")
			self.life = self.life - 1
			other:die()
		end
	end
}