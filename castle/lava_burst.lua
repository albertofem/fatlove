FireBurst = Tile:extend
{
	image = 'castle/assets/graphics/burst.png'
}

BigBurst = Tile:extend
{
	scale = 2,
	image = 'castle/assets/graphics/globe.png',
	
	onUpdate = function(self)
		self:collide(the.player['fario'])
	end
}

BigEmitter = Emitter:extend
{
	min = { 
		velocity = 
		{ 
			x = -100, 
			y = -500, 
			
			rotation = math.pi / 4 
		},
		
		scale = 2,
	},
	
    max = {
		velocity = 
		{ 
			x = 100, 
			y = 100, 
			
			rotation = 4 * math.pi 
		}, 
		
		scale = 3
	},
	
    period = 2,
	
	onNew = function(self)
		self:loadParticles(BigBurst, 5)
	end
}

LavaBurst = Emitter:extend
{
	min = { 
		velocity = 
		{ 
			x = -100, 
			y = -500, 
			
			rotation = math.pi / 4 
		}, 
		
		alpha = 0.25
	},
	
    max = {
		velocity = 
		{ 
			x = 100, 
			y = 100, 
			
			rotation = 4 * math.pi 
		}, 
		
		alpha = 0.75 
	},
	
    period = 0.10,
	
	onNew = function(self)
		self:loadParticles(FireBurst, 200)
		
		if not self.noBig then
			local bigEmitter = BigEmitter:new()
			bigEmitter.x = self.x
			bigEmitter.y = self.y
			
			the.view:add(bigEmitter)
		end
	end
}