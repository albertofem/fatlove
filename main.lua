STRICT = false
DEBUG = false

-- Required generic libraries
require 'zoetrope'
require 'global'

-- Require levels and stuff
require 'castle'
require 'menu'

the.app = App:new
{
	view = CastleLevel:new(),
	
	name = "Princess Madness", -- Cambiar cuando sepamos nombre

	onUpdate = function(self)
		if the.keys:justPressed('escape') == true then
			if(self.view:instanceOf(Subview)) then
				self.view:deactivate()
			else
				love.event.push('quit')
			end
		end
		
		if the.keys:justPressed('m') == true then
			self.view = Menu:new()
		end
	end
}

the.scoreboard = ScoreBoard:new()
-- the.timeLimit = TimeLimit:new()