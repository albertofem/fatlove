STRICT = false
DEBUG = false

-- Required generic libraries
require 'zoetrope'
require 'global'

-- Require levels and stuff
require 'castle'
require 'menu'
require 'win'
require 'end'

the.app = App:new
{
	view = Menu:new(),
	
	name = "Princess Madness", -- Cambiar cuando sepamos nombre

	onUpdate = function(self)
		if the.keys:justPressed('escape') == true then
			love.event.push('quit')
		end
		
		if the.keys:justPressed('enter') then
			the.view = CastleLevel:new()
		end
	end
}