-- Punto de entrada de la View del Menu

StartButton = Button:extend
{
        x = 300,
        y = 300,
        
        background = Tile:extend
        {
                x = 0,
                y = 0,
                
                width = 223,
                height = 37,
                
                image = 'menu/assets/graphics/button.png'
        },
        
        onMouseEnter = function(self)
                playSound('menu/assets/sounds/buttonOver.wav')
        end,
        
        onMouseUp = function(self)
                the.app.view = Level1:new()
        end
}

Menu = View:extend
{
        onNew = function(self)
                src1 = love.audio.newSource('menu/assets/music/title.mp3')
                
                src1:setVolume(0.3)
                
                src1:play()
                
        
                self.buttonStart = StartButton:new()
                self:add(self.buttonStart)
        end
}