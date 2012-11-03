-- Nivel 1: castillo

require 'castle/thwomp'
require 'castle/background'
require 'castle/turtle'
require 'castle/floor'

CastleLevel = Level:extend
{
    width = 5000,
    
    mapFile = 'castle/assets/maps/castle.lua',
    
    players = {
        main_player = Fario:new
        {
            x = love.graphics.getWidth() / 2, y = love.graphics.getHeight() / 2,
            
            acceleration = { x = 0, y = 600, rotation = 0 }
        }
    },
    
    backgrounds = {
        Background:new{
            translateScale = 0.25
        },
        Background:new{
            y = 100,
            translateScale = 0.5
        },
        Background:new{
            y = 200,
            translateScale = 1
        }        
    },
    
    thwomp = Thwomp:new
    {
        id = "thwomp"
    },

    turtle = Turtle:new
    {
        id = "turtle"
    },

    onCustomNew = function(self)
        self:addEnemy(self.thwomp)
        self:addEnemy(self.turtle)

        self.timer:start{ delay = 1, func = self.startLevel, arg = { self } }
    end,
    
    onLevelComplete = function(self)
        self.active = false
    end,
    
    onCustomUpdate = function(self)
    end,
    
    startLevel = function(self)
        self.start_level = true
    end
}