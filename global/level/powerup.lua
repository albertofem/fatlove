PowerUp = Tile:extend
{
	image = 'global/assets/graphics/powerup/wheels.png',
	
	onUpdate = function(self)
		self:collide(the.player['fario'])
	end,
	
	onCollide = function(self, other)
		if(other:instanceOf(Fario)) then
			self:die()
			other:onPowerUp()
		end
	end
}