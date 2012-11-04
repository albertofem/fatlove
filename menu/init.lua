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
			self.oldBack = self.background
		end,
		
		onMouseEnter = function(self)
			self.background = Tile:extend{ image = 'global/assets/graphics/interfazinicio/inicioyw.png' }
		end,
		
		onMouseExit = function(self)
			self.background = self.oldBack
		end,
		
		onMouseUp = function(self)
			the.app.view = CastleLevel:new()
			love.audio.stop(the.view.music)
		end
	},
	
	exit = Button:new
	{
		width = 130,
		y = 400,
		
		background = Tile:extend{ image = 'global/assets/graphics/interfazinicio/salir.png' },
		
		onNew = function(self)
			self.x = (love.graphics.getWidth() / 2) - self.width / 2
			self.oldBack = self.background
		end,
		
		onMouseEnter = function(self)
			self.background = Tile:extend{ image = 'global/assets/graphics/interfazinicio/saliryw.png' }
		end,
		
		onMouseExit = function(self)
			self.background = self.oldBack
		end,
		
		onMouseUp = function(self)
			love.event.push('quit')
		end
	},
	
	onNew = function(self)
		self:add(self.background)
		self:add(self.logo)
		self:add(self.start)
		self:add(self.exit)
		
		self.music = love.audio.newSource("global/assets/music/menu.wav")
		self.music:setLooping(true)
		
		love.audio.play(self.music)
	end
}