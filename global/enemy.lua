Enemy = Tile:extend
{
	id = "enemy", 
	x = 300,
	y = 240,
	
	life = 1,

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
	
	movement = MovingActor:new(),
	
	onUpdate = function(self)
		self.movement:onUpdate(self)
		self.jump:onUpdate(self)
	end,
	
	onCollide = function(self, other)
        self:displace(other) 
		if type(other) == "player" then
			self.life = self.life -1,
			print("colision")
		end 
		self.jump:onCollide(self, other)
	end
}