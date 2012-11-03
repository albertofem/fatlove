Fario = Player:extend
{
	width = 100,
	height = 174.5,
	
	sequencePool = {
		walking = 
		{
			image = 'global/assets/graphics/fario/run.png',
			
			right = { frames = { 1, 2, 3, 4, 5, 6, 7 }, fps = 25 },
			left = { frames = { 8, 9, 10, 11, 12, 13, 14 }, fps = 25 }
			--left = { frames = { 1, 2, 3, 4, 5, 6, 7 }, fps = 25 }
		},
		
		jumping =
		{
			image = 'global/assets/graphics/fario/jump.png',
			
			right = { frames = { 1 }, fps = 25 },
			left = { frames = { 6 }, fps = 25 },
			falling_right = { frames = { 2 }, fps = 25 },
			falling_left = { frames = { 7 }, fps = 25 },
			floor_right = { frames = { 3, 4, 5 }, fps = 25 },
			floor_left = { frames = { 8, 9, 10 }, fps = 25 },
		}
	},
	
	onCustomUpdate = function(self)
		if self:activeSequence('jumping') then
			if not self.currentName == 'floor_right' and not self.currentName == 'floor_left' then
				self:switchSequence('walking')
			end
		end
	end,
	
	onCustomNew = function(self)
		self:switchSequence('walking')
	end
}