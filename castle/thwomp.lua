Thwomp = Enemy:extend
{
	triggerX = 50,
	triggerY = 50000,
	
	image = 'castle/assets/graphics/thwomp.gif',
	
	triggerBox = Sprite:new
	{
		parent = nil,
		
		onCollide = function(self, other)
			self.parent.velocity.y = 800
		end
	},
	
	onNew = function(self)
		self.triggerBox.x = self.x - self.triggerX
		self.triggerBox.y = self.y - self.triggerY
		
		self.triggerBox.width = self.width + self.triggerX*2
		self.triggerBox.height = self.height + self.triggerY*2
		
		self.triggerBox.parent = self
	end,
	
	doCollide = function(self, other)
		self:collide(other)
		self.triggerBox:collide(other)
	end,
	
	onCollide = function(self, other)
		other:displace()
	end
}