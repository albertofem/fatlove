Enemy = Tile:extend
{
	id = "enemy", 
	x = 500,
	y = 270,
	
	life = 1,

	image = 'global/assets/graphics/soldier.png',
	
	acceleration = {
		x = -50, 
		y = 0, 
		rotation = 0 
	},
	
	--movement = MovingActor:new(),
	
	onUpdate = function(self)
	--	self.movement:onUpdate(self)
		if self.life <= 0 then
		end
	end,
	
	onCollide = function(self, other)
		if other.id == "player" then
			self.life = self.life -1
		end 
	end
}