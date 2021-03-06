Turtle = Enemy:extend
{
	id = 'turtle',
	
	width = 67,
	height = 101,
	
	direction = 1,

	movement = SimpleMovementEnemy:new(),
	
	acceleration = { y = 400, x = 0, rotation = 0 },
	
	died = false,

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
		self.movement.direction = self.direction
		
		if self.direction == -1 then
			self.flipX = true 
		end
		
		self:switchSequence('walking')
		self:play('walking')
		
		self:addAction(self.movement)
	end,
	
	onCustomCollide = function(self, other, horizOverlap, vertOverlap)
		if self.died then
			return
		end
		
		if(other:instanceOf(Player)) then
			if other.y+other.height <= self.y+50 then
				self:switchSequence('dying')
				playSound('global/assets/sounds/hittop.wav')
				other.velocity.y = -400
				self:play('dying')
				self.died = true
			else
				other:hit()
			end
		end
	end
}