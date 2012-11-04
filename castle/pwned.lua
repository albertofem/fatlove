Pwned = Enemy:extend
{
	triggerX = 50,
	triggerY = 50,
	
	triggerBox = TriggerBox:new
	{
		onCollide = function(self, other)
			the.app.view = Pwned:new()
		end
	},
}