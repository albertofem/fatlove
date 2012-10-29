-- Menu buttons

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
                
                image = 'menu/assets/graphics/button.png',
                
                onNew = function(self)
                        self:setEffect('menu/assets/shaders/button.glsl')
                end
        },
        
        onMouseEnter = function(self)
                playSound('menu/assets/sounds/buttonOver.wav')
        end,
        
        onMouseUp = function(self)
                Dialog:activate()
        end
}