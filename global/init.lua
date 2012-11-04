-- Include everything in it's right order

require 'global/level'
require 'global/actor'
require 'global/player'
require 'global/enemy'

ScoreBoard = Text:extend
{
    y = 35,
    x = 105,
    
    background = Tile:extend
    {
        y = 25,
        x = 15,
        
        image = 'global/assets/graphics/interfazinicio/pointswithout.png',
        
        onUpdate = function(self)
            self.x = (-1) * the.view.translate.x + 15
        end
    },
    
    font = { 'global/assets/fonts/AintNothingFancy.ttf', 75 },
    
    text = 0,
    
    started = false,
    
    addPoints = function(self, points)
        self.text = self.text+points
    end,
    
    addRecurrentPoints = function(self)
        self:addPoints(10)
    end,
    
    onUpdate = function(self)
        if not started then
            the.view.timer:start{ delay = 5, func = self.addRecurrentPoints, arg = { self }, repeats = true }
            started = true
        end
        
        self.x = (-1) * the.view.translate.x + 105
    end
}

TimeLimit = Text:extend
{
    y = 35,
    x = 300,
    
    background = Tile:extend
    {
        y = 25,
        x = 255,
        
        image = 'global/assets/graphics/interfazinicio/timewithout.png',
        
        onUpdate = function(self)
            self.x = (-1) * the.view.translate.x + 255
        end
    },
    
    font = { 'global/assets/fonts/AintNothingFancy.ttf', 75 },
    
    text = 0,
    
    started = false,
    
    setTimeLimit = function(self, timeLimit)
        self.text = timeLimit
    end,
    
    restTimeLimit = function(self)
        self.text = self.text-1
    end,
    
    startUpdate = function(self)
        the.view.timer:start{ delay = 1, func = self.restTimeLimit, arg = { self }, repeats = true }
    end,

    onUpdate = function(self)
        self.x = (-1) * the.view.translate.x + 300
    end
}

the.scoreboard = ScoreBoard:new()
the.timeLimit = TimeLimit:new()