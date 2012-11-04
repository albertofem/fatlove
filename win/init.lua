Win = View:extend
{
	background = Tile:extend
	{
		image = 'global/assets/graphics/mapa/gamewin.png'
	},
	
	onNew = function(self)
		self:add(self.background)
	end
}