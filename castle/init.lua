-- Nivel 1: castillo

CastleLevel = Level:new
{
    players = {
        main_player = Player:new
        {
            main_resource = Fill:new
            {
                width = 100, height = 100,
                x = love.graphics.getWidth() / 2, y = love.graphics.getHeight() / 2,
                
                fill = {255, 255, 255}
            }
        }
    },
    
    onCustomNew = function(self)
        self.timer:start{ delay = 1, func = self.startLevel, arg = { self } }
    end,
    
    startLevel = function(self)
        self.start_level = true
    end
}