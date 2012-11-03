Turtle = Enemy:extend
{

	image = 'castle/assets/graphics/KOOPA.png',
	
	onCustomNew = function(self)
		moveEnemy = SimpleMovementEnemy:extend{
			direction = -1,
			speed = math.random(50, 400)
		}

		self:addAction(self.moveEnemy)
	end,

	doCollide = function(self, other)
		self:collide(other)
	end,
	
	onCollide = function(self, other)
		other:displace()
	end
}