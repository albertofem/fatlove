Player = Actor:extend
{
	x = 400,
	y = 50,
	
	tile = Tile:extend{ image = 'global/assets/graphics/player.png' },

	width = 300,

	height = 300,
	
	jump = JumpingActor:new{ triggerKey = " ", sound = "global/assets/sounds/jump.wav" },
	
	acceleration = { x = 0, y = 600, rotation = 0 },
	
	movement = MovingActor:new(),
	
	onUpdate = function(self)
		self.movement:onUpdate(self)
		self.jump:onUpdate(self)
	end,
	
	onCollide = function(self)
		self.jump:onCollide(self)
	end


}