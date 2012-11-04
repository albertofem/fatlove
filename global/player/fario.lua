Fario = Player:extend
{
	id = "fario",
	
	width = 100,
	height = 157,
	
	powerUp = false,
	
	sequencePool = {
		walking = 
		{
			image = 'global/assets/graphics/fario/run.png',
			
			walking = { frames = { 1, 2, 3, 4, 5, 6, 7 }, fps = 25 },
		},
		
		jumping =
		{
			image = 'global/assets/graphics/fario/jump.png',
			
			jumping = { frames = { 1 }, fps = 25 },
			falling = { frames = { 2 }, fps = 25 },
			floor = { frames = { 3, 4, 5 }, fps = 25 },
		},

		waiting = 
		{
			image = 'global/assets/graphics/fario/run.png',
			
			waiting = { frames = { 1 }, fps = 25 },
		}
		
	},
	
	onCustomUpdate = function(self)
		if self:activeSequence('jumping') then
			if not self.currentName == 'floor_right' and not self.currentName == 'floor_left' then
				self:switchSequence('walking')
			end
		end
	end,
	
	onCustomCollide = function(self, other)
		if(other:instanceOf(BigBurst) or other:instanceOf(HeartBullet)) then
			self:die()
		end
	end,
	
	onPowerUp = function(self)
		if not self.powerUp then
			self.powerUp = true
			self.movement.speed.x = self.movement.speed.x+5
			
			the.view.timer:start{ delay = 2, func = self.onPowerUpOff, arg = { self } }
		end
	end,
	
	onPowerUpOff = function(self)
		self.powerUp = false
		self.movement.speed.x = 5
	end,
	
	onCustomNew = function(self)
		self:switchSequence('walking')
	end
}