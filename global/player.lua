Player = Tile:new
{
	x = 50,
	
	y = 50,
	
	image = 'global/assets/graphics/player.png',
	
	jumpeness = JumpingActor:new{ gravity = { x = 500 } },
	
	movement = MovingActor:new(self),
	
	onUpdate = function(self)
		self.movement:onUpdate(self)
	end
}