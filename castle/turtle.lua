Turtle = Enemy:extend
{
	id = 'turtle',
	
	width = 67,
	height = 101,

	movement = SimpleMovementEnemy:new(),
	
	acceleration = { y = 100, x = 0, rotation = 0 },

	sequencePool = {
		walking = 
		{
			image = 'global/assets/graphics/enemigos/tortugaanda.png',
			
			walking = { frames = { 1, 2, 3, 4 }, fps = 5 },
		},
		
		dying =
		{
			image = 'global/assets/graphics/enemigos/tortugamuerte.png',
			
			dying = { frames = { 1, 2, 3, 4 }, fps = 25, loops = false },
		},
	},
	
	onCustomNew = function(self)
		-- Set random speed
		self.velocity.x = math.random(5, 15)
		if self.movement.direction == -1 then self.flipX = true end
		
		self:switchSequence('walking')
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