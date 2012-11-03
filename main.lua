STRICT = true
DEBUG = true

-- Required generic libraries
require 'zoetrope'
require 'global'

-- Require levels and stuff
require 'castle'

the.app = App:new
{
	view = CastleLevel:new(),
	
	name = "Princess Madness", -- Cambiar cuando sepamos nombre
	
	onNew = function(self)
		if arg[#arg] == "-debug" then require("mobdebug").start() end
		love.mouse.setVisible(false)
	end,

	onUpdate = function(self)
		if the.keys:justPressed('escape') == true then
			if(self.view:instanceOf(Subview)) then
				self.view:deactivate()
			else
				love.event.push('quit')
			end
		end
	end
}