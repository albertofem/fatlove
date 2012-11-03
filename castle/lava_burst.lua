FireBurst = Tile:extend
{
	image = 'castle/assets/graphics/burst.png'
}

LavaBurst = Emitter:extend
{
	min = { 
		velocity = 
		{ 
			x = -100, 
			y = 500, 
			
			rotation = math.pi / 4 
		}, 
		
		alpha = 0.25 
	},
	
    max = {
		velocity = 
		{ 
			x = 100, 
			y = 0, 
			
			rotation = 4 * math.pi 
		}, 
		
		alpha = 0.75 
	},
	
    period = 0.05,
	
	onNew = function(self)
		self:loadParticles(FireBurst, 300)
	end
}