Fario = Player:extend
{
	id = "fario",
	
	width = 100,
	height = 157,
	
	powerUp = false,
	
	lifes = 10,
	
	inmune = false,
	
	blink = Tween:new(),
	
	alpha = 1,
	
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
		if self.lifes <= 0 then
			self:onDie()
		end
		
		if self:activeSequence('jumping') then
			if not self.currentName == 'floor_right' and not self.currentName == 'floor_left' then
				self:switchSequence('walking')
			end
		end
		
		-- Pan to level limit
		if self.x + the.view.translate.x + self.width >= the.app.width then
			print(self.x)
			self.movement.blockXMaxPos = true
		else
			self.movement.blockXMaxPos = false
		end
		
		-- Die if off limits
		if self.y - the.view.translate.y - self.height >= the.app.height then
			playSound('global/assets/music/hit.ogg')
			the.app.view = End:new()
		end
	end,
	
	onCustomCollide = function(self, other)
		if(other:instanceOf(BigBurst) or other:instanceOf(HeartBullet) or other:instanceOf(Thwomp)) then
			self:hit()
		end
		
		if(other:instanceOf(HeartBullet)) then
			other:die()
		end
		
		if(other:instanceOf(Princess)) then
			playSound('global/assets/music/hit.ogg')
			
			the.app.view = End:new()
		end
		
		if(other:instanceOf(Background)) then
			playSound('global/assets/music/hit.ogg')
			
			the.app.view = End:new()
		end
	end,
	
	hit = function(self)
		if self.inmune then
			return nil
		end
		
		playSound('global/assets/music/hit.ogg')
		
		self.lifes = self.lifes-1
	end,
	
	onHit = function(self)
		self.inmune = true
		
		the.view.timer:start{ delay = 2, func = self.onInmuneEnd, arg = { self } }
	end,
	
	onDie = function(self)
		the.app.view = End:new()
	end,
	
	onInmuneEnd = function(self)
		self.inmune = false
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
		self.movement.speed.x = 6
	end,
	
	onCustomNew = function(self)
		self:switchSequence('walking')
	end
}