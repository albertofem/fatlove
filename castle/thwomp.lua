Thwomp = Enemy:extend
{
	triggerX = 50,
	triggerY = love.graphics.getHeight(),
	
	image = 'global/assets/graphics/enemigos/piedraene.png',
	
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
	
	fall = function(self)
		if self.loading == false and self.falling == false then
			self.falling = true
			self.loading = false
			
			self.velocity.y = 800
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