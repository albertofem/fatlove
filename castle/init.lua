-- Nivel 1: castillo

require 'castle/thwomp'
require 'castle/turtle'

CastleLevel = Level:extend
{
    players = {
        main_player = Player:new
        {
            width = 100, height = 100,
            x = love.graphics.getWidth() / 2, y = love.graphics.getHeight() / 2,
            
            acceleration = { x = 0, y = 600, rotation = 0 },
            
            fill = { 255, 255, 255 },
        },
        
        second_player = Player:new
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
    
    floor = Fill:new
    {
        id = "suelo",
        
        width = 5000, height = 100,
        x = - 5000 + love.graphics.getWidth(),
        y = love.graphics.getHeight() - 100,

        fill = { 255, 255, 255 }
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
        self:add(self.floor)
        self:add(self.thwomp)
        self:add(self.thwomp.triggerBox)

        self:add(self.turtle)
        
        self.timer:start{ delay = 1, func = self.startLevel, arg = { self } }
    end,
    
    onLevelComplete = function(self)
        self.active = false
    end,
    
    onCustomUpdate = function(self)
        self.floor:collide(self.players['main_player'])
        self.floor:collide(self.players['second_player'])
        self.players['main_player']:collide(self.players['second_player'])
        self.thwomp:doCollide(self.players['main_player'])
    end,
    
    startLevel = function(self)
        self.start_level = true
    end
}