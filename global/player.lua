Player = Tile:extend
{
	x = 400,
	y = 50,
	
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
		bullet = Tile:new
		{
			image = 'global/assets/graphics/bullet.png',

			speed = {
				x = 10,
				y = 10
			}
		},
		
		angle = 0
	},
	
	onUpdate = function(self)
		self.movement:onUpdate(self)
		self.jump:onUpdate(self)
		self.shooting:onUpdate(self)
	end,
	
	onCollide = function(self, other)
		self.jump:onCollide(self, other)
	end
}