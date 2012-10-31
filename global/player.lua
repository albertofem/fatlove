Player = Tile:extend
{
	x = 400,
	y = 50,
	
	image = 'global/assets/graphics/player.png',

	jump = JumpingActor:new{ triggerKey = " ", sound = "global/assets/sounds/jump.wav" },
	
	acceleration = { x = 0, y = 600, rotation = 0 },
	
	movement = MovingActor:new(),
	
	onNew = function(self)
		self.shooting = ShootingActor:new{ bullet = Tile:extend{ image = 'global/assets/graphics/bullet.png' } }
	end,
	
	onUpdate = function(self)
		self.movement:onUpdate(self)
		self.jump:onUpdate(self)
		self.shooting:onUpdate(self)
	end,
	
	onCollide = function(self)
		self.jump:onCollide(self)
	end
}