End = View:extend
{
	background = Tile:extend
	{
		image = 'global/assets/graphics/mapa/gameover.png'
	},
	
	onNew = function(self)
		self:add(self.background)
	end
}