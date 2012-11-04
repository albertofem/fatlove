Thwomp = Enemy:extend
{
	id = "thwomp",
	
	width = 120,
	height = 140,

	triggerX = 50,
	triggerY = love.graphics.getHeight(),
	
	sequencePool = {
		standing = 
		{
			image = 'global/assets/graphics/enemigos/piedraene.png',
			
			standing = { frames = { 1 }, fps = 25 },
		},
	},

	loading = false,
	
	falling = false,
	
	triggerBox = TriggerBox:new
	{
		onCollide = function(self, other)
			if(other:instanceOf(Player)) then
				self.parent:fall()
			end
		end
	},
	
	onCustomNew = function(self)
		self:switchSequence('standing')
		self:play('standing')
		
		the.view:add(self.triggerBox)
	end,

	fall = function(self)
		if self.loading == false and self.falling == false then
			self.falling = true
			self.loading = false
			
			self.velocity.y = 600
		end
	end,
	
	onCustomUpdate = function(self)
		if self.y < 0 then
			self.y = 0
			
			self.loading = false
			self.falling = false
			self.velocity.y = 0
		end
	end,
	
	onCustomCollide = function(self, other, horizOverlap, vertOverlap)
		self.y = self.y-vertOverlap
		
		if other:instanceOf(Player) then
			other.jumping.canJump = false
			other.velocity.y = 0
		end
		
		self.loading = true
		self.falling = false
		
		the.view.timer:start{ delay = 1, func = self.goUp, arg = { self } }
	end,
	
	goUp = function(self)
		self.velocity.y = -300
	end
}