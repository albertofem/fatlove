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
                
                image = 'menu/assets/graphics/button.png'
        },
        
        onMouseEnter = function(self)
                playSound('menu/assets/sounds/buttonOver.wav')
        end,
        
        onMouseUp = function(self)
                Menu.titleMusic:stop()
                the.app.view = Level1:new()
        end
}