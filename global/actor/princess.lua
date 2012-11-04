Princess = ActorAnimation:extend
{
	width = 200,
	height = 335,
	
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
		
	onCustomNew = function(self)
		self:switchSequence('walking')
	end
}