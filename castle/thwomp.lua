Thwomp = Enemy:extend
{
	triggerX = 50,
	triggerY = love.graphics.getHeight(),
	
	image = 'castle/assets/graphics/thwomp.gif',
	
	triggerBox = TriggerBox:new
	{
		onCollide = function(self, other)
			self.parent.velocity.y = 800
		end
	},
	
	onCustomUpdate = function(self)
		if self.y < 0 then
			self.velocity.y = 0
		end
	end,
	
	onCustomCollide = function(self)
		the.view.timer:start{ delay = 1, func = self.goUp, arg = { self } }
	end,
	
	goUp = function(self)
		self.velocity.y = -300
	end
}