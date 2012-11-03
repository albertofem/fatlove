-- Nivel 1: castillo

require 'castle/thwomp'
require 'castle/background'

CastleLevel = Level:extend
{
    width = 5000,
    
    players = {
        main_player = Fario:new
        {
            x = love.graphics.getWidth() / 2, y = love.graphics.getHeight() / 2,
            
            acceleration = { x = 0, y = 600, rotation = 0 }
        },
        
        second_player = Fario:new
        {
            width = 200, height = 100,
            x = (love.graphics.getWidth() / 2) + 200, y = love.graphics.getHeight() / 2,
            
            acceleration = { x = 0, y = 600, rotation = 0 },
            
            fill = { 255, 255, 255 },
            
            onCustomNew = function(self)
                self.jumping.triggerKey = "w"
                self.movement.leftKey = "a"
            end
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
    
    floor = Fill:new
    {
        id = "suelo",
        
        solid = true,
        
        width = 5000, height = 100,
        x = - 5000 + love.graphics.getWidth(),
        y = love.graphics.getHeight() - 100,

        fill = { 255, 255, 255 }
    },
    
    thwomp = Thwomp:new
    {
        id = "thwomp"
    },
    
    onCustomNew = function(self)
        self:add(self.floor)
        self:addEnemy(self.thwomp)

        self.timer:start{ delay = 1, func = self.startLevel, arg = { self } }
    end,
    
    onLevelComplete = function(self)
        self.active = false
    end,
    
    onCustomUpdate = function(self)
        self.floor:collide(self.players['main_player'])
        self.floor:collide(self.players['second_player'])
        self.floor:collide(self.thwomp)
    end,
    
    startLevel = function(self)
        self.start_level = true
    end
}