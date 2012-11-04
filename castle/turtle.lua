Turtle = Enemy:extend
{
	width = 67,
	height = 101,

	velocity = { y = 1000, x = math.random(1, 10) },

	movement = SimpleMovementEnemy:new
	{
		direction = 1
	},

	sequencePool = {
		walking = 
		{
			image = 'global/assets/graphics/enemigos/tortugaanda.png',
			
			walking = { frames = { 1, 2, 3, 4 }, fps = 25 },
		},
		
		dying =
		{
			image = 'global/assets/graphics/enemigos/tortugamuerte.png',
			
			dying = { frames = { 1, 2, 3, 4 }, fps = 25, loops = false },
		},
	},
	
	onCustomNew = function(self)
		self:switchSequence('walking')
		if self.direction == -1 then self.flipX = true end
		self:play('walking')
		self:addAction(self.movement)
	end,
	
	onCustomCollide = function(self, other, horizOverlap, vertOverlap)
		self.y = self.y-vertOverlap
		
		if(other:instanceOf(Player)) then
			if other.y+other.height <= self.y+50 then
				self:switchSequence('dying')
				playSound('global/assets/sounds/hittop.wav')
				other.velocity.y = -400
				self:play('dying')
			else
				other:die()
			end
		end
	end
}