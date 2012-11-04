PowerUp = Tile:extend
{
	image = 'global/assets/graphics/tire.png',
	
	onCollide = function(self, other)
		if(other:instanceOf(Fario)) then
			self:die()
			other:powerUp()
		end
	end
}