Menu = View:extend
{
	background = Tile:new
	{
		x = 0,
		y = 0,
		image = 'global/assets/graphics/mapa/background02.png'
	},
	
	logo = Tile:new
	{
		y = 100,
		image = 'global/assets/graphics/interfazinicio/logo.png',
		
		onNew = function(self)
			self.x = (love.graphics.getWidth() / 2) - self.width / 2
		end
	},
	
	start = Button:new
	{
		width = 163,
		y = 300,
		
		background = Tile:extend{ image = 'global/assets/graphics/interfazinicio/inicio.png' },
		
		onNew = function(self)
			self.x = (love.graphics.getWidth() / 2) - self.width / 2
		end,
		
		onMouseUp = function(self)
			the.app.view = CastleLevel:new()
		end
	},
	
	loadMainLevel = function(self)
		the.app.view = CastleLevel:new()
	end,
	
	options = Button:new
	{
		y = 400,
		width = 246,
		background = Tile:extend{ image = 'global/assets/graphics/interfazinicio/opciones.png'},
		
		onNew = function(self)
			self.x = (love.graphics.getWidth() / 2) - self.width / 2
		end
	},
	
	exit = Button:new
	{
		width = 130,
		y = 500,
		background = Tile:extend{ image = 'global/assets/graphics/interfazinicio/salir.png' },
		
		onNew = function(self)
			self.x = (love.graphics.getWidth() / 2) - self.width / 2
		end
	},
	
	onNew = function(self)
		self:add(self.background)
		self:add(self.logo)
		self:add(self.start)
		self:add(self.options)
		self:add(self.exit)
	end
}