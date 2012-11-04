Finish = Sprite:extend
{
	triggerX = 50,
	triggerY = 10,
	
	triggerBox = TriggerBox:extend{
		onCollide = function(self, other)
			if(other:instanceOf(Player)) then
				the.app.view = Finish:new()
			end
		end
	}
}