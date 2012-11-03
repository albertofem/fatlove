Turtle = Enemy:extend
{
	image = 'castle/assets/graphics/KOOPA.png',
	
	x = 100,
	
	velocity = { y = 1000, x = math.random(1, 10) },
	
	movement = SimpleMovementEnemy:new
	{
		direction = 1
	},
	
	onCustomNew = function(self)
		self:addAction(self.movement)
	end,
	
	onCustomCollide = function(self, actor)
		if(actor:instanceOf(Player)) then
			if actor.y+actor.height <= self.y+50 then
				playSound('global/assets/sounds/hittop.wav')
				actor.velocity.y = -400
				self:die()
			else
				actor:die()
			end
		end
	end
}