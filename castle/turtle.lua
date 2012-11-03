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
	
	onCustomCollide = function(self, other, horizOverlap, vertOverlap)
		self.y = self.y-vertOverlap
		
		if(other:instanceOf(Player)) then
			if other.y+other.height <= self.y+50 then
				playSound('global/assets/sounds/hittop.wav')
				other.velocity.y = -400
				self:die()
			else
				other:die()
			end
		end
	end
}