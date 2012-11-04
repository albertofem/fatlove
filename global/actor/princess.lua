Princess = ActorAnimation:extend
{
	width = 200,
	height = 335,
	
	x = -200,
	y = 280,
	
	sequencePool = {
		walking = 
		{
			image = 'global/assets/graphics/princesa/run.png',
			
			walking = { frames = { 1, 2, 3, 4 }, fps = 25 },
		},
		
		attacking =
		{
			image = 'global/assets/graphics/princesa/attack.png',
			
			attack = { frames = { 1, 2, 3, 4, 5 }, fps = 25 },
		},
	},
	
	onShow = function(self)
		self.velocity.x = 50
	end,
		
	onNew = function(self)
		self:switchSequence('walking')
		self:play('walking')
	end,
	
	onStop = function(self)
		self.velocity.x = 0
		self:freeze()
	end
}